use std::vec;
use serde::Serialize;

#[derive(Serialize)]
pub struct User {
    id: i32,
    name: String,
    email: String,
}

fn create_user(id: i32, name: &str, email: &str) -> User {
    User { id, name: name.to_string(), email: email.to_string() }
}

fn example_data() -> Vec<User> {
    let u1 = create_user(1, "John", "john@example.com");
    let u2 = create_user(2, "Alice", "alice@example.com");
    let u3 = create_user(3, "Bob", "bob@example.com");

    vec![u1, u2, u3]
}

pub fn get_users() -> Vec<User> {
    example_data()
}

pub fn get_user(id: i32) -> Option<User> {
    example_data().iter().find_map(|u| {
        if u.id == id {
            Some(*u)
        } else {
            None
        }
    })
}