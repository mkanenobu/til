pub(crate) trait Kvs {
    fn get(&self, key: String) -> Option<String>;
    fn set(&mut self, key: String, value: String);
}
