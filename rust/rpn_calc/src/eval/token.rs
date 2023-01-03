use crate::eval::stack::StackItem;

pub enum Token {
    Number(StackItem),
    Operator(String),
}
