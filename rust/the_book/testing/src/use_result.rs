#[cfg(test)]
mod tests {
    #[test]
    fn use_result_for_test() -> Result<(), String> {
        if 2 + 2 == 4 {
            Ok(())
        } else {
            Err(String::from("two plus two does not equal four"))
        }
    }
}
