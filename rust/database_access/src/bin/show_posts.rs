use database_access::models::post::Post;
use database_access::*;
use diesel::prelude::*;

fn main() {
    use self::schema::posts::dsl::*;

    let conn = &mut db::connection::establish_connection();
    let results = posts
        .filter(published.eq(true))
        .limit(5)
        .load::<Post>(conn)
        .expect("Error loading posts");

    println!("Displaying {} posts", results.len());
    for post in results {
        println!("ID: {}", post.id);
        println!("Title: {}", post.title);
        println!("-----------\n");
        println!("{}", post.body);
    }
}
