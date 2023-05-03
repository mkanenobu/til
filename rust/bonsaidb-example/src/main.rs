mod collections;

use bonsaidb::core::connection::Connection;
use bonsaidb::core::schema::SerializedCollection;
use bonsaidb::local::config::{Builder, StorageConfiguration};
use bonsaidb::local::Database;
use collections::{book, message::Message};

#[tokio::main]
async fn main() -> Result<(), bonsaidb::core::Error> {
    basic().await?;
    view_example().await?;

    Ok(())
}

const DB_PATH: &str = "basic.bonsaidb";

async fn basic() -> Result<(), bonsaidb::core::Error> {
    let db = Database::open::<Message>(StorageConfiguration::new(DB_PATH))?;

    let message_documents = ["Hello, World!", "Test1", "Test2"]
        .iter()
        .map(|msg| Message::new(msg.to_string()))
        .collect::<Vec<Message>>();
    let message_collection = db.collection::<Message>();

    let message_ids = message_documents.iter().map(|message| {
        let push_result = message_collection
            .push(message)
            .expect("couldn't insert message");
        push_result.id
    });

    let stored_messages =
        Message::get_multiple(message_ids, &db).expect("couldn't retrieve stored items");

    for msg in &stored_messages {
        println!("{}", msg.contents);
    }

    let collection_all_count = message_collection.all().count()?;
    println!("{:?}", collection_all_count);

    // delete all
    let all_ids = message_collection.all().query()?;
    all_ids.iter().for_each(|msg_doc| {
        message_collection
            .delete(&msg_doc.header)
            .expect("couldn't delete item")
    });

    Ok(())
}

const VIEW_DB_PATH: &str = "view-example.bonsaidb";
async fn view_example() -> Result<(), bonsaidb::core::Error> {
    let db = Database::open::<book::Book>(StorageConfiguration::new(VIEW_DB_PATH))?;

    book::Book {
        title: "人間失格".to_string(),
        author: "太宰治".to_string(),
    }
    .push_into(&db)?;
    book::Book {
        title: "吾輩は猫である".to_string(),
        author: "夏目漱石".to_string(),
    }
    .push_into(&db)?;
    book::Book {
        title: "それから".to_string(),
        author: "夏目漱石".to_string(),
    }
    .push_into(&db)?;

    let view = db.view::<book::BooksAuthorView>();

    let written_by_natsume_souseki = view
        .with_key("夏目漱石".to_string())
        .query_with_collection_docs()?;
    println!("{:#?}", written_by_natsume_souseki.documents);

    Ok(())
}
