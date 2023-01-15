use anyhow::Result;
use std::net::UdpSocket;
use std::str;

pub fn serve(address: &str) -> Result<()> {
    let serve_socket = UdpSocket::bind(address)?;
    debug!("Listening on: {}", address);
    loop {
        let mut buf = [0u8; 1024];
        // tcp_server の実装はコネクションを張ることで一つのクライアントが一つのソケットを占有していたので新しいスレッドを起動していた
        // こちらの実装は一つのソケットで全てのクライアントとの通信を捌くのでスレッドを起動する必要がない
        // tcp_server のようなサーバを並行サーバと言い、このようなサーバを反復サーバと言う
        let (nbytes, src) = serve_socket.recv_from(&mut buf)?;
        debug!("Handling data from {}", src);
        println!("[Server]: {}", str::from_utf8(&buf[..nbytes])?);

        serve_socket.send_to(&buf, &src)?;
    }
}
