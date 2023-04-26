use anyhow::Result;
use mongodb::{options::ClientOptions, Client};
use std::env;

pub async fn init_db() -> Result<Client> {
    let db_url = env::var("DB_URL")?;
    let username = env::var("DB_USERNAME")?;
    let password = env::var("DB_PASSWORD")?;

    let mut client_options = ClientOptions::parse(db_url).await?;
    client_options.credential = Some(
        mongodb::options::Credential::builder()
            .username(username)
            .password(password)
            .build(),
    );
    client_options.app_name = Some("app".to_string());
    let client = Client::with_options(client_options)?;
    Ok(client)
}
