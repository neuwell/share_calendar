# share_calendar
- 自分の1ヶ月のスケジュールをカレンダー形式で公開するアプリ

## 環境構築

```
設定ファイルの編集
cp .env-example .env
vi .env

ホストマシン
$ cd scdock
$ docker-compose up -d app --build
$ dokcer-compose exec app bash

Dockerマシン
$ pwd
→ /var/www
/app
フロントサーバー起動
$ cd frontend/app
$ npm run dev

Rails サーバー起動
$ cd backend/app
$ rail s
```

## 目標
- アプリの完成
- Railsでの実装からRubyと合わせて知見を得る

## 備考
- 自動テストがかけていない
- 機能が簡素
- GitでこまめにCommitするなどの管理をしなかった

## 構成
Rails5.2
Vue.js2.3

## 進捗
- [x] スケジュール一覧取得API実装
- [x] スケジュール一覧取得画面の実装
- [x] スケジュール取得API実装
- [x] スケジュール取得画面の実装
- [x] スケジュール登録画面の実装
- [ ] スケジュール登録API実装
- [ ] バリデーションの強化
- [ ] 全体的な動作確認

## 展望
- [ ] ソーシャルログインによって、予定表と個人の関連付け
- [ ] 通知の強化によって個人の予定をチェックするユーザの利便性の向上
