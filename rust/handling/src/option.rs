use std::fs::File;
use std::io::Read;

fn file() -> Option<File> {
    let f = File::open("notexists");
    match f {
        Ok(f) => Some(f),
        Err(_err) => None,
    }
}

pub fn option() {
    let f = file();
    match f {
        Some(mut file) => {
            let mut buf = String::new();
            file.read_to_string(&mut buf).expect("Failed to read");
            println!("{}", buf)
        },
        None => println!("File is not exists")
    }
}