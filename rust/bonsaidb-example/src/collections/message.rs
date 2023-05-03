use bonsaidb::core::schema::Collection;
use chrono::prelude::{DateTime, Utc};
use serde::{Deserialize, Serialize};
use std::fmt;
use std::time::SystemTime;

#[derive(Debug, Serialize, Deserialize, Collection)]
#[collection(name = "messages")]
pub struct Message {
    pub timestamp: SystemTime,
    pub contents: String,
}

impl Message {
    pub fn new(contents: String) -> Self {
        Self {
            timestamp: SystemTime::now(),
            contents,
        }
    }
}

impl fmt::Display for Message {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let dt: DateTime<Utc> = self.timestamp.into();
        write!(f, "[{}]: {}", dt.format("%+"), self.contents)
    }
}
