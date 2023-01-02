use crate::models::post::{NewPost, Post};
use diesel::mysql::MysqlConnection;
use diesel::prelude::*;

pub fn create_post(conn: &mut MysqlConnection, title: &str, body: &str) -> QueryResult<Post> {
    use crate::schema::posts;

    let new_post = NewPost { title, body };

    diesel::insert_into(posts::table)
        .values(&new_post)
        .get_result(conn)?
}
