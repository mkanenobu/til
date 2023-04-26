use reqwest::{Body, Client, Response};
use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
pub struct SynthesisQuery {
    pub enable_interrogative_upspeak: Option<bool>,
    pub speaker: u32,
}

pub async fn synthesis(
    client: &Client,
    query_params: &SynthesisQuery,
    body: impl Into<Body>,
) -> Result<Response, Box<dyn std::error::Error>> {
    let resp = client
        .post("http://localhost:50021/synthesis")
        .query(query_params)
        .body(body)
        .send()
        .await?;
    Ok(resp)
}
