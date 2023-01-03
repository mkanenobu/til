use crate::eval::token::Token;

pub fn parse_line(input: &str) -> Vec<Token> {
    input
        .split_whitespace()
        .map(|token| parse_token(token))
        .collect()
}

fn parse_token(s: &str) -> Token {
    if let Ok(number) = s.parse::<i32>() {
        Token::Number(number)
    } else {
        Token::Operator(s.to_string())
    }
}
