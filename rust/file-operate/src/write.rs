use std::fs::File;
use std::io::Write;

pub fn write_file(filename: &str, content: String) {
    let mut f = File::create(filename).expect("Failed to create file");

    f.write(content.as_bytes()).expect("Failed to write file");
}
