use anyhow::Result;
use std::collections::HashMap;

#[tokio::main]
async fn main() {
    let _ = async_request()
        .await
        .map(|response| {
            println!("{:?}", response);
            let ip = response
                .get("origin")
                .and_then(|origin| origin.parse::<std::net::IpAddr>().ok());
            println!("{:?}", ip);
        })
        .map_err(|err| {
            println!("{:?}", err);
        });
}

async fn async_request() -> Result<HashMap<String, String>> {
    let response = reqwest::get("https://httpbin.org/ip")
        .await?
        .json::<HashMap<String, String>>()
        .await?;
    Ok(response)
}
