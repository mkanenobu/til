mod protos;

use base64::{engine::general_purpose::STANDARD_NO_PAD as base64_engine, Engine as _};
use protobuf::Message;
use protos::person::{person, Person};

fn main() {
    let person = Person::random_new();
    let bytes = person
        .write_to_bytes()
        .map(|bytes| base64_engine.encode(&bytes))
        .unwrap();
    dbg!(&bytes);

    let deserialized_person =
        Person::parse_from_bytes(&base64_engine.decode(&bytes).unwrap().as_slice()).unwrap();
    println!("{}", deserialized_person);
}

// ↓Random Data Generator
use rand::Rng;

impl Person {
    fn random_new() -> Self {
        let mut rng = rand::thread_rng();
        let mut person = Person::new();
        person.name = gen_random_string(10);
        person.age = rng.gen_range(0..100);
        person.height = rng.gen_range(130.0..180.0);
        person.sex = {
            if rng.gen::<bool>() {
                person::Sex::MALE
            } else {
                person::Sex::FEMALE
            }
        }
        .into();

        person
    }
}

use rand::seq::SliceRandom;

const BASE_STR: &str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

fn gen_random_string(size: usize) -> String {
    let mut rng = &mut rand::thread_rng();
    String::from_utf8(
        BASE_STR
            .as_bytes()
            .choose_multiple(&mut rng, size)
            .cloned()
            .collect(),
    )
    .unwrap()
}
