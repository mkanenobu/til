mod evaluator;
mod read_loop;

use crate::evaluator::EvaluatorImpl;
use crate::read_loop::start_repl;

fn main() {
    let evaluator = EvaluatorImpl::new();
    start_repl(evaluator);
}
