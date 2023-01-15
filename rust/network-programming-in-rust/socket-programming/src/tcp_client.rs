use anyhow::Result;
use std::io::{self, BufRead, BufReader, Write};
use std::net::TcpStream;
use std::str;

pub fn connect(address: &str) -> Result<()> {
    let mut stream = TcpStream::connect(address)?;
    loop {
        let mut input = String::new();
        io::stdin().read_line(&mut input)?;
        stream.write_all(input.as_bytes())?;

        let mut reader = BufReader::new(&stream);
        let mut buf = Vec::new();
        reader.read_until(b'\n', &mut buf)?;
        println!("[Client]: {}", str::from_utf8(&buf)?);
    }
}