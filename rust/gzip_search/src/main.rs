use flate2::{write::ZlibEncoder, Compression};
use std::io::Write;

fn main() {
    let data = dummy_data();
    // アルゴリズムの特性上、クエリが長いと精度が上がる
    let query = "宇宙探査船".to_string();

    let result = gzip_search(query, data, 3);
    println!("{:#?}", result);
}

fn compress(payload: &str) -> Vec<u8> {
    let mut e = ZlibEncoder::new(Vec::new(), Compression::default());
    e.write_all(payload.as_bytes()).unwrap();
    e.finish().unwrap()
}

fn compress_length(payload: &str) -> usize {
    compress(payload).len()
}

// NOTE: 元の文字列とクエリを足した文字列の圧縮率の差分を計算してクエリへの近さを計算するアルゴリズム
fn gzip_search<T>(query: String, candidate: Vec<T>, top_k: usize) -> Vec<T>
where
    T: SearchSerializable,
{
    let query_length = compress_length(&query) as f64;

    let mut candidate_distances: Vec<(T, f64)> = candidate
        .into_iter()
        .map(|candidate| {
            let candidate_str = &candidate.to_search_string();
            let candidate_length = compress_length(&candidate_str) as f64;

            let concatenated_length =
                compress_length(&format!("{}{}", query, candidate_str)) as f64;

            let distance = (concatenated_length - f64::max(query_length, candidate_length))
                / f64::max(query_length, candidate_length);

            (candidate, distance)
        })
        .collect();

    candidate_distances.sort_by(|a, b| a.1.partial_cmp(&b.1).unwrap());

    candidate_distances
        .into_iter()
        .map(|(candidate, _)| candidate)
        .take(top_k)
        .collect()
}

trait SearchSerializable {
    fn to_search_string(&self) -> String;
}

// Dummy data
#[derive(Debug)]
struct Book {
    pub title: String,
    pub author: String,
    pub publication_year: u32,
    pub description: String,
}

impl Book {
    pub fn new(title: &str, author: &str, publication_year: u32, description: &str) -> Book {
        Book {
            title: title.to_string(),
            author: author.to_string(),
            publication_year,
            description: description.to_string(),
        }
    }
}

impl SearchSerializable for Book {
    fn to_search_string(&self) -> String {
        format!(
            "{},{},{},{}",
            self.title, self.author, self.publication_year, self.description
        )
    }
}

fn dummy_data() -> Vec<Book> {
    vec![
        Book::new(
            "不思議なブラックホール",
            "佐藤健太",
            2010,
            "宇宙探査船が奇妙な現象に遭遇する科学小説。",
        ),
        Book::new(
            "影の道",
            "山田愛子",
            2005,
            "忍者たちの秘密結社と正義の道を追求する主人公の冒険物語。",
        ),
        Book::new(
            "追憶の橋",
            "高橋玲子",
            1999,
            "壊れた家族の絆を取り戻すため、主人公が向かう故郷で繰り広げられる物語。",
        ),
        Book::new(
            "生命の道",
            "伊藤一郎",
            2012,
            "未来の地球を舞台に、科学技術と人間の生存というテーマに迫ったハードSF小説。",
        ),
        Book::new(
            "夢見る街",
            "長谷川信也",
            2008,
            "都会の喧騒から離れた小さな町でつむがれる人々の交流と成長を描いたヒューマンドラマ。",
        ),
    ]
}
