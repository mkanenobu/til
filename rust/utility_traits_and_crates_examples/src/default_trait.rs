use std::default::Default;

pub fn default_trait_example() {
    let my_struct = MyStruct::default();
    println!("{:?}", my_struct);
    let derived_default = DerivedDefault::default();
    println!("{:?}", derived_default);
}

#[derive(Debug)]
struct MyStruct {
    #[allow(dead_code)]
    value: i32,
    #[allow(dead_code)]
    option_number: Option<i32>,
}

impl Default for MyStruct {
    fn default() -> Self {
        Self {
            value: 0,
            option_number: None,
        }
    }
}

#[derive(Debug, Default)]
struct DerivedDefault {
    #[allow(dead_code)]
    value: String,
    #[allow(dead_code)]
    option: Option<i32>,
    // derive(Default) するには含まれる型全てに Default が実装されている必要がある
    // result: Result<i32, String>,
}
