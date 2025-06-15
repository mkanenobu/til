# 2048 Game - Zig Implementation

GoのTUI版2048ゲームをZigで再実装したものです。

## 必要環境

- Zig 0.12.0以上

## ビルドと実行

```bash
# ビルド
zig build

# 実行
zig build run

# テスト実行
zig build test
```

## 操作方法

- 矢印キー: タイルを移動
- WASD: タイルを移動（代替操作）
- ESC または Q: ゲーム終了
- Ctrl+C: 強制終了

## ファイル構成

- `src/main.zig`: メイン処理、入力処理、ゲームループ
- `src/state.zig`: ゲーム状態管理、ロジック、テスト
- `src/draw.zig`: 描画機能
- `src/constants.zig`: 定数定義
- `build.zig`: ビルド設定

## 特徴

- テスト駆動開発（TDD）で実装
- 標準ライブラリのみを使用
- POSIX準拠の端末制御
- 包括的なテストカバレッジ