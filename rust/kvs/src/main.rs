mod compression;
mod distributed_kvs;
mod hash;
mod kvs_trait;
mod single_server_kvs;

use kvs_trait::Kvs;
use single_server_kvs::SingleServerKvs;

fn main() {
    let mut ss_kvs = SingleServerKvs::new();
    ss_kvs.set("key".to_string(), "value".to_string());
    let v = ss_kvs.get("key".to_string());
    println!("{:?}", v);
    println!("{:?}", ss_kvs.get("no-key".to_string()));

    let mut d_kvs = distributed_kvs::DistributedKvs::new(4);
    for i in 0..10000 {
        d_kvs.set(
            format!("key{}", i.to_string()),
            format!("value{}", i.to_string()),
        );
    }
    d_kvs.debug_print_node_balance();
    println!("{:?}", d_kvs.get("key1".to_string()));
    println!("{:?}", d_kvs.get("key999".to_string()));
}
