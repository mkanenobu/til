use crate::models::post::NewPost;
use diesel::mysql::MysqlConnection;
use diesel::prelude::*;

pub fn create_post(conn: &mut MysqlConnection, title: &str, body: &str) -> usize {
    use crate::schema::posts;

    let new_post = NewPost { title, body };

    diesel::insert_into(posts::table)
        .values(&new_post)
        // .get_result(conn) // Not working, Maybe MySQL doesn't support
        .execute(conn)
        .expect("Error saving new post")
}
