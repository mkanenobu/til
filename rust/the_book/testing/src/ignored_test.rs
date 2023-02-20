#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }

    #[test]
    // ignore を付けるとテストは無視される
    // ignored オプションを付けると ignore を付けたテストのみが実行される
    #[ignore]
    fn heavy_test() {
        // heavy test
        // 1500s
        std::thread::sleep(std::time::Duration::from_secs(1500));
    }
}
