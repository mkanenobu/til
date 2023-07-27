use rand::rngs::OsRng;
use rsa::{Pkcs1v15Encrypt, RsaPrivateKey, RsaPublicKey};
use std::str;

pub fn rsa_example() {
    let (public_key, private_key) = generate_keypair();
    let message = "Hello, world!";

    let encrypted_message = encrypt_message(message, &public_key);
    println!("encrypted: {:?}", hex::encode(encrypted_message.clone()));

    let decrypted_message = decrypt_message(&encrypted_message, &private_key);
    println!("decrypted: {}", str::from_utf8(&decrypted_message).unwrap());
}

fn generate_keypair() -> (RsaPublicKey, RsaPrivateKey) {
    let mut rng = OsRng;
    let bits = 2048;
    let private_key = RsaPrivateKey::new(&mut rng, bits).expect("Failed to generate a key");
    let public_key = RsaPublicKey::from(&private_key);

    (public_key, private_key)
}

fn encrypt_message(message: &str, public_key: &RsaPublicKey) -> Vec<u8> {
    let mut rng = OsRng;

    let encrypted_message = public_key
        .encrypt(&mut rng, Pkcs1v15Encrypt, message.as_bytes())
        .expect("Failed to encrypt message");

    encrypted_message
}

fn decrypt_message(encrypted_message: &[u8], private_key: &RsaPrivateKey) -> Vec<u8> {
    let decrypted_message = private_key
        .decrypt(Pkcs1v15Encrypt, encrypted_message)
        .expect("Failed to decrypt message");

    decrypted_message
}
