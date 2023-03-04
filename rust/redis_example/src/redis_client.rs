extern crate redis;

use redis::Commands;

const REDIS_URL: &str = "redis://127.0.0.1:8376";

pub fn get(key: String) -> Result<String, anyhow::Error> {
    let client = redis::Client::open(REDIS_URL)?;
    let mut conn = client.get_connection()?;
    let r: String = conn.get(key)?;
    Ok(r)
}

pub fn set(key: String, val: String) -> Result<String, anyhow::Error> {
    let client = redis::Client::open(REDIS_URL)?;
    let mut conn = client.get_connection()?;
    let r = conn.set(key, val)?;
    Ok(r)
}
