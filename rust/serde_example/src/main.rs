#[macro_use]
extern crate serde_derive;
extern crate serde;
extern crate serde_json;
extern crate uuid;

use uuid::Uuid;

#[derive(Serialize, Deserialize, Debug)]
struct User {
    id: String,
    age: u32,
    email: String,
}

fn main() {
    serialize();
    deserialize();
}

fn serialize() {
    let user = User {
        id: Uuid::new_v4().to_string(),
        age: 33u32,
        email: "test@example.com".to_string()
    };

    let json_str = serde_json::to_string(&user).unwrap();
    println!("Serialized Json = {}", json_str);
}

fn deserialize() {
    let json_str = r#"
        {
            "id": "67e55044-10b1-426f-9247-bb680e5fe0c8",
            "age": 33,
            "email": "input@example.com"
        }
    "#;
    let user: User = serde_json::from_str(json_str).unwrap();
    println!("Deserialized User = {:?}", user);
}