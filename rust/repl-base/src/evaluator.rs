pub trait Evaluator {
    fn eval(&self, line: &str);
}

pub struct EvaluatorImpl {}

impl EvaluatorImpl {
    pub fn new() -> EvaluatorImpl {
        EvaluatorImpl {}
    }
}

impl Evaluator for EvaluatorImpl {
    fn eval(&self, line: &str) {
        println!("echo: {}", line);
    }
}
