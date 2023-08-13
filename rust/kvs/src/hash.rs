pub(crate) fn hash(payload: &str) -> blake3::Hash {
    blake3::hash(payload.as_bytes())
}
