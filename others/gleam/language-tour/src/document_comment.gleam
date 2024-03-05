//// スラッシュ4つはモジュールのドキュメンテーションに利用するコメントでモジュール（ファイル）の先頭に置く必要がある

import gleam/io

/// 型コメント
///
pub type Never {
  Never(Never)
}

/// スラッシュ3つは型と関数のドキュメンテーションに利用するコメントで型や関数の直前に置く必要がある
/// 
pub fn document_comment() {
  // gleam docs build でドキュメントを生成出来る
  io.println("Document comment")
}
