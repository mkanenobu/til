use crate::evaluator::Evaluator;
use rustyline::error::ReadlineError;
use rustyline::Editor;
use std::process;

const PROMPT: &str = "> ";

pub fn start_repl(evaluator: impl Evaluator) {
    let mut rl = Editor::<()>::new().unwrap();

    loop {
        let readline = rl.readline(PROMPT);
        match readline {
            Ok(line) => {
                rl.add_history_entry(line.as_str());
                evaluator.eval(line.as_str());
            }
            Err(ReadlineError::Interrupted) => {
                // Ctrl-C
                println!("Bye!");
                process::exit(0);
            }
            Err(ReadlineError::Eof) => {
                // Ctrl-D
                println!("Bye!");
                process::exit(0);
            }
            Err(err) => {
                println!("Error: {:?}", err);
                process::exit(1);
            }
        }
    }
}
