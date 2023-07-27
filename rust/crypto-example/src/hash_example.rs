pub fn hash_example() {
    let data = "Hello, world!";
    println!("SHA256: {}", hex::encode(sha256_hash(&data.as_bytes())));
    println!("blake2: {}", hex::encode(blake2_hash(&data.as_bytes())));
}

fn sha256_hash(data: &[u8]) -> Vec<u8> {
    use sha2::{Digest, Sha256};

    let mut hasher = Sha256::new();
    hasher.update(data);
    hasher.finalize().to_vec()
}

fn blake2_hash(data: &[u8]) -> Vec<u8> {
    use blake2::{Blake2s256, Digest};

    let mut hasher = Blake2s256::new();
    hasher.update(data);
    hasher.finalize().to_vec()
}
