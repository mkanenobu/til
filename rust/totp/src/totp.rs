use std::time;

pub struct Totp {
    secret_key: [u8; 32],
    time_step: time::Duration,
    num_of_digits: usize,
}

impl Totp {
    pub fn new(
        secret_key: [u8; 32],
        time_step: Option<time::Duration>,
        num_of_digits: Option<usize>,
    ) -> Self {
        Self {
            secret_key,
            time_step: time_step.unwrap_or(time::Duration::from_secs(30)),
            num_of_digits: num_of_digits.unwrap_or(6),
        }
    }

    #[allow(dead_code)]
    pub fn secret_key(&self) -> &[u8; 32] {
        &self.secret_key
    }
}

impl Totp {
    pub fn generate(&self) -> String {
        let counter = self.counter();
        let code = hmac_sha256(&self.secret_key.to_vec(), &counter.to_be_bytes());
        Self::truncate(code, self.num_of_digits)
    }

    fn counter(&self) -> u64 {
        let timestamp = time::SystemTime::now()
            .duration_since(time::UNIX_EPOCH)
            .unwrap()
            .as_secs();
        timestamp / self.time_step.as_secs()
    }

    // 結果を切り詰める
    fn truncate(code: Vec<u8>, number_of_digits: usize) -> String {
        let offset = code.last().unwrap() & 0xF;
        let code = ((code[offset as usize] & 0x7F) as u32) << 24
            | ((code[(offset + 1) as usize] & 0xFF) as u32) << 16
            | ((code[(offset + 2) as usize] & 0xFF) as u32) << 8
            | (code[(offset + 3) as usize] & 0xFF) as u32;
        let code = code % 10u32.pow(number_of_digits as u32);
        format!("{:0>1$}", code, number_of_digits)
    }
}

use hmac::{Hmac, Mac};
use sha2::Sha256;

pub type HmacSha256 = Hmac<Sha256>;

fn hmac_sha256(key: &[u8], data: &[u8]) -> Vec<u8> {
    let mut hmac = HmacSha256::new_from_slice(key).expect("HMAC can take key of any size");
    hmac.update(data);
    let r = hmac.finalize();
    r.into_bytes().to_vec()
}
