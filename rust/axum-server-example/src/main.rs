use axum::{
    extract::Path,
    http::StatusCode,
    routing::{get, post},
    Json, Router,
};
use serde::{Deserialize, Serialize};
use std::net::SocketAddr;
use tower::ServiceBuilder;
use tower_http::trace::TraceLayer;
use tracing::{debug, info};
use uuid::Uuid;

const PORT: u16 = 5000;

#[tokio::main]
async fn main() {
    tracing_subscriber::fmt()
        .with_max_level(tracing::Level::DEBUG)
        .init();

    let addr = SocketAddr::from(([127, 0, 0, 1], PORT));

    let app = create_app();

    info!("listening on {}", addr);
    axum::Server::bind(&addr)
        .serve(app.into_make_service())
        .await
        .unwrap();
}

fn create_app() -> Router {
    Router::new()
        // `GET /` goes to `root`
        .route("/", get(root))
        // `POST /users` goes to `create_user`
        .route("/users", post(create_user))
        .route("/users/:id", get(get_user))
        .layer(ServiceBuilder::new().layer(TraceLayer::new_for_http()))
}

// basic handler that responds with a static string
async fn root() -> &'static str {
    "Hello, World!"
}

static mut USERS_STORE: Vec<User> = vec![];

async fn get_user(Path(user_id): Path<String>) -> (StatusCode, Json<Option<User>>) {
    let user = unsafe { USERS_STORE.iter().find(|u| u.id == user_id) };
    if user.is_some() {
        (StatusCode::OK, Json(user.cloned()))
    } else {
        (StatusCode::NOT_FOUND, Json(None))
    }
}

async fn create_user(Json(payload): Json<CreateUser>) -> (StatusCode, Json<User>) {
    // insert your application logic here
    let user = User {
        id: Uuid::new_v4().to_string(),
        username: payload.username,
    };

    unsafe {
        debug!("Accessing unsafe USERS_STORE");
        USERS_STORE.push(user.clone());
    };

    info!("user created: {:?}", user);

    // this will be converted into a JSON response
    // with a status code of `201 Created`
    (StatusCode::CREATED, Json(user))
}

// the input to our `create_user` handler
#[derive(Deserialize)]
struct CreateUser {
    username: String,
}

// the output to our `create_user` handler
#[derive(Serialize, Debug, Clone)]
struct User {
    id: String,
    username: String,
}
