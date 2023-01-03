mod eval;
mod read;

use crate::eval::stack::Stack;
use crate::read::stdin_read_loop::stdin_read_loop;

fn main() {
    let mut stack: Stack = vec![];
    let _ = ctrlc::set_handler(move || {
        println!("\nBye");
        std::process::exit(0);
    });
    stdin_read_loop(&mut stack)
}
