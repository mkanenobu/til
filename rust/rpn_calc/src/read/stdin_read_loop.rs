use crate::eval::{eval::eval, stack::Stack};
use std::io::{self, Write};

pub fn stdin_read_loop(stack: &mut Stack) {
    loop {
        print!("> ");
        let _ = io::stdout().flush();

        let mut input = String::new();
        io::stdin()
            .read_line(&mut input)
            .expect("Failed to read line");

        if input.trim() == "exit" {
            println!("Bye");
            break;
        }

        eval(stack, &input);
        println!("{:?}", stack);
    }
}
