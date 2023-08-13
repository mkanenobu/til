use flate2::write::ZlibEncoder;
use flate2::Compression;
use std::io::prelude::*;

pub(crate) fn compression(payload: &[u8]) -> Vec<u8> {
    let mut encoder = ZlibEncoder::new(Vec::new(), Compression::default());
    encoder.write_all(payload).unwrap();
    encoder.finish().unwrap()
}

use flate2::read::ZlibDecoder;

pub(crate) fn decompression(payload: &[u8]) -> Vec<u8> {
    let mut decoder = ZlibDecoder::new(payload);
    let mut buffer = Vec::new();
    decoder.read_to_end(&mut buffer).unwrap();
    buffer
}
