mysonarqube
===


# Pg11 -> Pg18

 - Pg11にはないSQL構文が使われていてmigrateがエラーになるためこの時点のサポート上限であるPg18に移行
 - 旧DBバックアップ
 - Pg18コンテナをcompose.yamlに追加
   - Pg18イメージのディレクトリ構造が変わったため、volume化階層を変更
     ```
     ./pgsql/var/lib/postgresql/data:/var/lib/postgresql/data
     ↓
     ./pgsql/var/lib/postgresql18:/var/lib/postgresql/
     ```
   - compose upして新DB初期化されたことを確認
 - 旧DBバックアップを新DBにリストア
 - 旧コンテナ定義を削除して新コンテナに旧コンテナのホスト名設定
   - sonar.propertiesで新コンテナに向けてもいい
 - compose upしてsetupからのmigrate

