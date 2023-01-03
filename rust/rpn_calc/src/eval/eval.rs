use crate::eval::{parser, stack::Stack, token::Token};

const STACK_EMPTY_MESSAGE: &str = "Stack is empty";

fn print_stack_is_empty() {
    println!("{}", STACK_EMPTY_MESSAGE);
}

pub fn eval(stack: &mut Stack, input: &str) {
    let line = parser::parse_line(input);

    line.iter().for_each(|token| match &token {
        Token::Number(n) => stack.push(*n),
        Token::Operator(op) => eval_operation(stack, op),
    });
}

pub fn eval_operation(stack: &mut Stack, op: &str) {
    match op {
        "pop" => {
            if let Some(n) = stack.pop() {
                println!("{}", n);
            } else {
                print_stack_is_empty();
            }
        }
        _ => {
            let a = match stack.pop() {
                Some(n) => n,
                None => {
                    print_stack_is_empty();
                    return;
                }
            };
            let b = match stack.pop() {
                Some(n) => n,
                None => {
                    print_stack_is_empty();
                    return;
                }
            };

            let result = match op {
                "+" => a + b,
                "-" => a - b,
                "*" => a * b,
                "/" => a / b,
                _ => panic!("Unknown operator"),
            };
            stack.push(result);
        }
    };
}
