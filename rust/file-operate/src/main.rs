mod read;
mod write;

fn main() {
    let text = read::read_file("./files/example.txt");
    println!("{:?}", text);

    write::write_file("./files/write.txt", text);
}
