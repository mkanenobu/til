use std::io::{self, Write};
use std::{thread::sleep, time::Duration};

fn main() -> io::Result<()> {
    let str = "Hello, world!".to_string();
    let mut stdout = io::stdout().lock();

    str.chars().enumerate().for_each(|(i, char)| {
        sleep(Duration::from_millis(200));
        stdout.write_all(char.to_string().as_bytes()).unwrap();
        stdout.flush().unwrap();
    });
    writeln!(stdout).unwrap();

    Ok(())
}
