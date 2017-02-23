# Techbo
技術者向けのTech Blog

# 実装したこと
- ログイン機能
- 画像投稿
  - プレビュー機能
- 記事投稿
  - タグを追加できる
  - マークダウン記法
  - 変更差分を確認
  - ドラフト機能
- 記事にコメント機能
- シェア機能(Tw, Fb, G+...)
- 記事のいいね機能
- 検索機能(タグ, タイトル, 本文)
- マイページの実装
- キャッシュで高速化
- 親しみやすいデザイン

## ログイン機能
メールアドレスでのログインを実装しました。

![log-in scene](https://github.com/hyde2able/techbo/images/login.png)

## 画像投稿
paperclipを用いて、AWS S3に画像を保存しています。
パフォーマンス向上のために`lazyload.js`を用いて遅延ロードを実装しています。
また、画像投稿のさいに、変更後の画像をすぐに確認できるようにプレビュー機能を実装しました。

![log-in scene](https://github.com/hyde2able/techbo/images/upload.png)

## 記事投稿
画像に紐付いた記事を投稿できます。
記事には本文のほか、タグを登録出来ます。
本文はマークダウンで書いた記事をプレビュータブで確認できます。
記事を「まだ公開しない」にチェックすると、記事はドラフト状態になって、共有リンクを発行します。

![log-in scene](https://github.com/hyde2able/techbo/images/upload-entry.png)


# 技術
|           | Version |
|:---------:|:-------:|
|Ruby       | 2.2.3   |
|Rails      | 5.0.1   |
|Semantic UI| 2.2     |
|Heroku     |         |
|Postgres   |         |
|
