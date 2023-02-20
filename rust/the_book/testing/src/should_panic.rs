pub struct Guess {
    value: i32,
}

impl Guess {
    pub fn new(value: i32) -> Guess {
        if value < 1 {
            panic!(
                //予想値は1以上でなければなりませんが、{}でした。
                "Guess value must be greater than or equal to 1, got {}.",
                value
            );
        } else if value > 100 {
            panic!(
                //予想値は100以下でなければなりませんが、{}でした。
                "Guess value must be less than or equal to 100, got {}.",
                value
            );
        }

        Guess { value }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    // pass on panic
    #[test]
    #[should_panic]
    fn smaller_than_1() {
        Guess::new(0);
    }

    #[test]
    // pass on specified panic
    #[should_panic(expected = "Guess value must be less than or equal to 100")]
    fn greater_than_100() {
        Guess::new(200);
    }

    // This test will fail
    // #[test]
    // // pass on specified panic
    // #[should_panic(expected = "Guess value must be less than or equal to 100")]
    // fn smaller_than_() {
    //     Guess::new(0);
    // }
}
