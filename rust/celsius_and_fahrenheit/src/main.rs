use std::fmt;

fn main() {
    let temperature = Celsius(25.0);
    println!("{}", temperature);
    let fahrenheit: Fahrenheit = temperature.into();
    println!("{}", fahrenheit);
    println!("{}", Into::<Celsius>::into(fahrenheit));
}

struct Celsius(f64);
struct Fahrenheit(f64);

impl Into<Fahrenheit> for Celsius {
    fn into(self) -> Fahrenheit {
        Fahrenheit(self.0 * 1.8 + 32.0)
    }
}

impl Into<Celsius> for Fahrenheit {
    fn into(self) -> Celsius {
        Celsius((self.0 - 32.0) / 1.8)
    }
}

impl fmt::Display for Celsius {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{}°C", self.0)
    }
}

impl fmt::Display for Fahrenheit {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{}°F", self.0)
    }
}
