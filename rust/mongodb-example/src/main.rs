mod collections;
mod mongo_client;

use anyhow::Result;
use dotenv::dotenv;
use futures::stream::TryStreamExt;
use mongodb::{bson::doc, Collection};

#[tokio::main]
async fn main() -> Result<()> {
    dotenv().ok();

    let client = mongo_client::init_db().await?;
    let db = client.database("app");
    let books_collection = db.collection::<collections::book::Book>("books");

    insert(&books_collection).await?;
    find_one(&books_collection).await?;
    find_many(&books_collection).await?;

    delete_one(&books_collection).await?;

    let all_books: Vec<collections::book::Book> = take_all(&books_collection).await?;
    println!("all_books: {:#?}", all_books);

    delete_many(&books_collection).await?;

    let all_books: Vec<collections::book::Book> = take_all(&books_collection).await?;
    println!("all_books: {:#?}", all_books);

    Ok(())
}

async fn insert(books_collection: &Collection<collections::book::Book>) -> Result<()> {
    // delete all
    books_collection.delete_many(doc! {}, None).await?;

    let books_insert_data: Vec<collections::book::Book> = vec![
        collections::book::Book {
            title: "The Great Gatsby".to_string(),
            author: "F. Scott Fitzgerald".to_string(),
        },
        collections::book::Book {
            title: "The Trial".to_string(),
            author: "Franz Kafka".to_string(),
        },
        collections::book::Book {
            title: "The Stranger".to_string(),
            author: "Albert Camus".to_string(),
        },
        collections::book::Book {
            title: "人間失格".to_string(),
            author: "太宰治".to_string(),
        },
        collections::book::Book {
            title: "The Metamorphosis".to_string(),
            author: "Franz Kafka".to_string(),
        },
        collections::book::Book {
            title: "The Castle".to_string(),
            author: "Franz Kafka".to_string(),
        },
    ];
    books_collection
        .insert_many(books_insert_data, None)
        .await?;

    Ok(())
}

async fn find_one(books_collection: &Collection<collections::book::Book>) -> Result<()> {
    let dazai = books_collection
        .find_one(doc! { "author": "太宰治" }, None)
        .await?;
    println!("dazai: {:?}", dazai);

    Ok(())
}

async fn find_many(books_collection: &Collection<collections::book::Book>) -> Result<()> {
    // take all
    let cursor = books_collection.find(doc! {}, None).await?;
    let all_books: Vec<collections::book::Book> = cursor.try_collect().await?;
    println!("all_books: {:#?}", all_books);

    Ok(())
}

async fn delete_one(books_collection: &Collection<collections::book::Book>) -> Result<()> {
    let remove_kafka_result = books_collection
        .delete_one(doc! { "author": "Franz Kafka" }, None)
        .await?;
    println!("remove one kafka book result: {:?}", remove_kafka_result);

    Ok(())
}

async fn delete_many(books_collection: &Collection<collections::book::Book>) -> Result<()> {
    let remove_kafka_result = books_collection
        .delete_many(doc! { "author": "Franz Kafka" }, None)
        .await?;
    println!("remove all kafka books result: {:?}", remove_kafka_result);

    Ok(())
}

async fn take_all<T>(collection: &Collection<T>) -> Result<Vec<T>>
where
    T: serde::de::DeserializeOwned + Unpin + Send + Sync,
{
    let cursor = collection.find(doc! {}, None).await?;
    let records: Vec<T> = cursor.try_collect().await?;
    Ok(records)
}
