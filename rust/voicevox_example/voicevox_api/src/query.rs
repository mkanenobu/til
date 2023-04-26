use reqwest::{Client, Response};
use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
pub struct AudioQueryQuery {
    pub text: String,
    pub speaker: u32,
}

pub async fn audio_query(
    client: &Client,
    query_params: &AudioQueryQuery,
) -> Result<Response, Box<dyn std::error::Error>> {
    let resp = client
        .post("http://localhost:50021/audio_query")
        .query(query_params)
        .send()
        .await?;
    Ok(resp)
}
