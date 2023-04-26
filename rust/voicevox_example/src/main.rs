mod play_audio;

use crate::play_audio::{play_audio, PlayAudioOptions};
use voicevox_api::{query, synthesis};

#[tokio::main]
async fn main() {
    let speaker = 3;

    let client = reqwest::Client::new();

    let query_params = query::AudioQueryQuery {
        text: "こんにちは、ボイスボックスです。".to_string(),
        speaker,
    };
    let audio_query_res = query::audio_query(&client, &query_params)
        .await
        .unwrap()
        .text()
        .await
        .unwrap();

    let synthesis_params = synthesis::SynthesisQuery {
        enable_interrogative_upspeak: None,
        speaker,
    };
    let synthesis_res = synthesis::synthesis(&client, &synthesis_params, audio_query_res)
        .await
        .unwrap()
        .bytes()
        .await
        .unwrap();

    let mut playback_option = PlayAudioOptions::new();
    playback_option.volume = 0.1;
    play_audio(synthesis_res, playback_option).await;
}
