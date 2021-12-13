use warp::Filter;

mod models;
mod hello_handler;
mod user_handler;

#[tokio::main]
async fn main() {
    // GET /hello/warp => 200 OK with body "Hello, warp!"
    // let routes = warp::path("hello").and(warp::path::param()).and_then(hello_handler::hello_handler);
    let user = warp::path("users").and(warp::path::param()).and_then(user_handler::users_handler);

    warp::serve(user)
        .run(([127, 0, 0, 1], 3030))
        .await;
}