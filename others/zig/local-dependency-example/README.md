# local-dependency-example

ローカルのFS上でコードをサブモジュールに切り分けるサンプル

## 手順

メインモジュールとサブモジュールは存在するところから

1. サブモジュールからコードをmoduleとして公開する
    - サブモジュール側の `build.zig` の `b.addModule`
2. メインモジュール側の `build.zig.zon` にサブモジュールへの参照を追加
    - dependency名がキー、値にパスを含む構造体
3. メインモジュールの `build.zig` でdependencyを参照
    - `b.dependency(...)`
4. dependencyからmoduleを取得
    - `dep.module(...)`
5. メインモジュールからimportを解決出来るように設定
    - `exe.root_module.addImport(...)`
