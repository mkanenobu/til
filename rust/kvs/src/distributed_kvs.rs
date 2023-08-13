use crate::compression;
use crate::hash;
use crate::kvs_trait::Kvs;
use std::collections::HashMap;

pub(crate) struct Node {
    store: HashMap<String, Vec<u8>>,
}

impl Node {
    fn new() -> Self {
        Node {
            store: HashMap::new(),
        }
    }

    fn set(&mut self, key: String, value: String) {
        let v = DistributedKvs::compressed_value(value);
        let key = DistributedKvs::hashed_key(&key);
        self.store.insert(key, v);
    }

    fn get(&self, key: String) -> Option<String> {
        let key = DistributedKvs::hashed_key(&key);
        let d = self.store.get(&key).cloned()?;
        Some(DistributedKvs::decompression_value(d))
    }
}

// 簡易な（仮想）分散KVS、仮想ノード・リバランスなどは未実装
// 本来データは違うサーバー上にありネットワーク経由で通信するが面倒なので同じメモリ上に置いている
pub struct DistributedKvs {
    nodes: HashMap<[u8; 32], Node>,
    node_count: u16,
}

impl DistributedKvs {
    pub fn new(node_count: u16) -> Self {
        let mut nodes: HashMap<[u8; 32], Node> = HashMap::with_capacity(node_count as usize);

        for i in 0..node_count {
            // 本来はキーがインデックスに依存するのは良くない
            let id: [u8; 32] = hash::hash(&i.to_string()).into();
            nodes.insert(id, Node::new());
        }

        DistributedKvs { nodes, node_count }
    }
}

impl DistributedKvs {
    fn hashed_key(key: &str) -> String {
        hash::hash(key).to_string()
    }

    fn compressed_value(value: String) -> Vec<u8> {
        compression::compression(value.as_bytes())
    }

    fn decompression_value(value: Vec<u8>) -> String {
        String::from_utf8(compression::decompression(&value)).unwrap()
    }

    fn target_node_id(&self, key: &str) -> [u8; 32] {
        let mut keys: Vec<&[u8; 32]> = self.nodes.keys().collect();
        let first = keys[0].clone();
        keys.sort();
        for k in keys {
            if k > &hash::hash(key).into() {
                return *k;
            }
        }
        first
    }
}

impl DistributedKvs {
    pub fn debug_print_node_balance(&self) {
        println!("node_count: {:?}", self.node_count);
        let mut keys = self.nodes.keys().collect::<Vec<&[u8; 32]>>();
        keys.sort();
        for k in keys {
            let node = self.nodes.get(k).unwrap();
            println!("node_id: {:?}, key count: {:?}", k, node.store.len());
        }
    }
}

// FIXME: 2回づつハッシュ化が走っている
impl Kvs for DistributedKvs {
    fn set(&mut self, key: String, value: String) {
        let node_id = self.target_node_id(&key);

        let node = self
            .nodes
            .get_mut(&node_id)
            .expect(format!("node_id: {:?} not found", node_id).as_str());
        node.set(key, value);
    }

    fn get(&self, key: String) -> Option<String> {
        let node_id = self.target_node_id(&key);

        self.nodes
            .get(&node_id)
            .expect(format!("node_id: {:?} not found", node_id).as_str())
            .get(key)
    }
}
