use crate::compression;
use crate::hash;
use crate::kvs_trait::Kvs;
use std::collections::HashMap;

pub struct SingleServerKvs {
    store: HashMap<String, Vec<u8>>,
}

impl SingleServerKvs {
    pub fn new() -> Self {
        SingleServerKvs {
            store: HashMap::new(),
        }
    }
}

impl SingleServerKvs {
    fn hashed_key(key: &str) -> String {
        hash::hash(key).to_string()
    }

    fn compressed_value(value: String) -> Vec<u8> {
        compression::compression(value.as_bytes())
    }

    fn decompression_value(value: Vec<u8>) -> String {
        String::from_utf8(compression::decompression(&value)).unwrap()
    }
}

impl Kvs for SingleServerKvs {
    fn set(&mut self, key: String, value: String) {
        let key = Self::hashed_key(&key);
        let v = Self::compressed_value(value);

        self.store.insert(key, v);
    }

    fn get(&self, key: String) -> Option<String> {
        let key = Self::hashed_key(&key);
        let d = self.store.get(&key).cloned()?;
        Some(Self::decompression_value(d))
    }
}
