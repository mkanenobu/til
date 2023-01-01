// Result<Ok type, Err type>
fn result_ok() -> Result<i32, &'static str> {
    Ok(1)
}

fn result_err() -> Result<i32, &'static str> {
    Err("err")
}

pub fn result() {
    let ok = result_ok();
    let err = result_err();

    // pattern match
    match ok {
        Ok(result) => println!("result: {}", result),
        Err(err) => println!("{}", err)
    }
    match err {
        Ok(result) => println!("result: {}", result),
        Err(err) => println!("{}", err)
    }

    // if
    if let Ok(v) = err {
        println!("Not err, result: {}", v);
    } else {
        println!("err");
    }
}