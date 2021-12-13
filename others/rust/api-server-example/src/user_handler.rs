use crate::models::user;

fn parse_id(id: String) -> i32 {
    id.parse::<i32>().unwrap()
}

pub async fn users_handler(id: String) -> Result<impl warp::Reply, warp::Rejection> {
    let user = user::get_user(parse_id(id));

    match user {
        Some(u) => Ok(warp::reply::json(&u)),
        None => Err(warp::reject::not_found()),
    }
}