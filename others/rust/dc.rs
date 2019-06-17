use std::io;
use std::process::exit;

fn stack_pop(stack: &mut Vec<f64>) -> f64 {
    match stack.pop() {
        Some(n) => n,
        None => {
            println!("Stack underflow!");
            exit(1);
        },
    }
}
fn calc(stack: &mut Vec<f64>, op: &str) {
    let n1 = stack_pop(stack);
    let n2 = stack_pop(stack);

    match op {
        "+" => stack.push(n2 + n1),
        "-" => stack.push(n2 - n1),
        "*" => stack.push(n2 * n1),
        "/" => stack.push(n2 / n1),
        _ => panic!("panic"),
    }
}

fn main(){
    let mut stack: Vec<f64> = vec![];

    loop {
        let mut line = String::new();
        io::stdin().read_line(&mut line)
            .expect("Filed to read line");

        'input: for i in line.split_whitespace() {
            if i.parse::<f64>().is_ok() {
                let f: f64 = i.parse().unwrap();
                stack.push(f);
                continue;
            } else {
                match &*i.to_string() {
                    "+" => calc(&mut stack, "+"),
                    "-" => calc(&mut stack, "-"),
                    "*" => calc(&mut stack, "*"),
                    "/" => calc(&mut stack, "/"),
                    "." => {
                        let n = stack_pop(&mut stack);
                        println!("{:?}", n);
                    },
                    _ => {
                        println!("Unexpected character!");
                        exit(2);
                    },
                }
            }
        }
        println!("{:?}", stack);
    }
}
