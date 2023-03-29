#[macro_export]
macro_rules! ignore {
    ($e:expr) => {
        let _ = $e;
    };
}
