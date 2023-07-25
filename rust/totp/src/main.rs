mod totp;

use std::time;
use totp::Totp;
use totp_rs::{Algorithm, TOTP};

fn main() {
    let key = [
        214, 108, 127, 131, 152, 64, 219, 142, 153, 77, 142, 239, 81, 168, 194, 151, 222, 197, 1,
        204, 31, 62, 18, 125, 68, 145, 77, 116, 151, 152, 44, 69,
    ];

    let totp = TOTP::new(Algorithm::SHA256, 6, 0, 30, key.clone().to_vec()).unwrap();
    println!("Existing library (totp-rs)",);
    println!("{}", totp.generate_current().unwrap());

    let totp = Totp::new(key, Some(time::Duration::from_secs(30)), Some(6));
    println!("Self implemented");
    println!("{}", totp.generate());
}
