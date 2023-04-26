use bytes::Bytes;
use rodio::{Decoder, OutputStream, Sink, Source};
use std::io::Cursor;

pub struct PlayAudioOptions {
    pub volume: f32,
}

impl PlayAudioOptions {
    pub fn new() -> Self {
        Self { volume: 1.0 }
    }
}

pub async fn play_audio(bytes: Bytes, options: PlayAudioOptions) {
    let cursor = Cursor::new(bytes.to_vec());
    let (_stream, stream_handle) = OutputStream::try_default().unwrap();
    let sink = Sink::try_new(&stream_handle).unwrap();

    let source = Decoder::new(cursor).unwrap().amplify(options.volume);

    sink.append(source);
    sink.sleep_until_end();
}
