use std::io;

fn read_line_parse_int() -> Vec<String> {
    let stdin = io::stdin();
    let mut s = String::new();
    stdin.read_line(&mut s).ok();
    s.trim().split_whitespace().map(|e| e.parse().ok().unwrap()).collect()
}

fn main(){
    let mut stack: Vec<f64> = vec![];

    loop {
        let line = read_line_parse_int();
        'input: for i in &line {
            if i.parse::<f64>().is_ok() {
                let f: f64 = i.parse().unwrap();
                stack.push(f);
                break
            } else {
                let n1 = match stack.pop() { Some(n) => n, None => { break 'input} };
                let n2 = match stack.pop() { Some(n) => n, None => { break 'input} };

                match i {
                    "+" => stack.push(n1 + n2),
                    "-" => stack.push(n1 - n2),
                    "/" => stack.push(n1 / n2),
                    "*" => stack.push(n1 * n2),
                }
            }
        }
        println!("{:?}", stack);
    }
}
