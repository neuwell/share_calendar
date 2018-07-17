# 準備
## 設定ファイル
cd {your_repository/docker}

cp .env-example .env

vi .env

APP_REPOSITORY_NAMEをアプリのリポジトリ名に変更


## アプリの起動
```
docker-compose up -d --build
```

```
docker-compose exec -it app bash
```

Bundle インストール(for Linux)
```
bundle install
```

Bundle インストール(for Windows)
※ ホストマシンとのファイル共有領域にインストールすると後の動作に影響するため
```
bundle install --path /opt/app/vendor/bundle/
```


DB 構築
```
rails db:migration
rails db:seed
```

簡易サーバー起動
```
rails s
```

アクセス
 - [http://localhost:3000](http://localhost:3000)
