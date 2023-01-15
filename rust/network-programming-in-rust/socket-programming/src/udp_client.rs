use anyhow::Result;
use std::net::UdpSocket;
use std::{io, str};

pub fn communicate(address: &str) -> Result<()> {
    // 0番ポートを使うと OS が自動で空いているポートを割り当ててくれる
    let socket = UdpSocket::bind("127.0.0.1:0")?;
    loop {
        let mut input = String::new();
        io::stdin().read_line(&mut input)?;
        // UDP は送信相手が存在するかを確認せずにデータを送信する
        socket.send_to(input.as_bytes(), address)?;

        // バッファのサイズが1024バイトなので1024バイトからのデータは破棄される
        let mut buf = [0u8; 1024];
        socket.recv_from(&mut buf).expect("failed to receive data");

        println!("[Client]: {}", str::from_utf8(&buf)?);
    }
}
