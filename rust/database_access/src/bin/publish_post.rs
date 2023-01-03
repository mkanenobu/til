use database_access::*;
use diesel::prelude::*;
use std::env::args;

fn main() {
    use self::schema::posts::dsl::{posts, published};

    let id = args()
        .nth(1)
        .expect("publish_post requires a post id")
        .parse::<i32>()
        .expect("Invalid ID");

    let conn = &mut db::connection::establish_connection();

    let count = diesel::update(posts.find(id))
        .set(published.eq(true))
        .execute(conn)
        .unwrap();
    println!("Published {} posts", count);
}
