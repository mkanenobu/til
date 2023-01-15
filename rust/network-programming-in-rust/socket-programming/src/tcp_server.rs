use anyhow::Result;
use std::io::{Read, Write};
use std::net::{TcpListener, TcpStream};
use std::{str, thread};

/**
 * 指定のソケットアドレスで接続を待ち受ける
 */
pub fn serve(address: &str) -> Result<()> {
    let listener = TcpListener::bind(address)?;
    loop {
        let (stream, _) = listener.accept()?;
        // ハンドラをサブスレッドで実行しているのは read で待機する時にスレッドをブロックするため
        thread::spawn(move || {
            handler(stream).unwrap_or_else(|error| error!("{:?}", error));
        });
    }
}

fn handler(mut stream: TcpStream) -> Result<()> {
    debug!("Handling data from {}", stream.peer_addr()?);
    let mut buf = [0u8; 1024];
    loop {
        let nbytes = stream.read(&mut buf)?;
        if nbytes == 0 {
            debug!("Connection closed.");
            return Ok(());
        }
        print!("[Server]: {}", str::from_utf8(&buf[..nbytes])?);
        stream.write_all(&buf[..nbytes])?;
    }
}