fn main(){
    // Boolean
    let _true: bool = true;
    let _false: bool = false;

    // Char
    let _c1: char = 'x';
    let _c2: char = '💕'; // 'char' is 4 byte

    // String
    let _str: &str = "string";

    // Numeric
    // integer
    let _int8: i8 = 1;
    let _int16: i16 = -10;
    let _int32: i32 = 1000;
    let _int64: i64 = -10000000000000000;
    // unsigned integer
    let _uint16: u16 = 10;
    // float
    let _float32: f32 = 0.1;
    let _float64: f64 = 10000.0000001;
    // depends on machine
    let _int: isize = -100;
    let _uint: usize = 100;

    // Array
    let _a1: [i32; 3] = [1,2,3]; // [T; N]
    let _a2 = [0; 3]; // [0,0,0]
    println!("{}", _a2.len());
    // slice
    let _a3 = [1,2,3,4,5];
    let _complete = &_a3[..]; // all elements
    let _middle = &_a3[1.._a3.len() - 1];
    // {:?}: debug print
    println!("{:?}", _middle);

    // Tuple
    let _t1: (i32, &str) = (1, "Hello");
    let (_x, _y, _z) = (1,2,3);
    println!("{}", _x);
    // tuple index
    println!("{}", _t1.1);

    // _fnはi32を受け取り、i32を返す関数への関数ポインタ
    fn foo(x: i32) -> i32 { x }
    let _fn: fn(i32) -> i32 = foo;
}
