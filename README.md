小劇場向けの公演予約アプリ 「ってよ」
[画像]
## 概要
主催者はお客さんを集めたい演劇を投稿し予約の管理をすることができ、お客さんはチケットの予約をすることができます。
## リンク
https://tteyo.net/
## コンセプト
シンプルな操作で公演情報やお客様の予約情報を管理できます。

## 制作背景&このサイトで実現できること

俳優をしている時に制作スタッフさんがチケット予約サイトが高いと言っていたことを思い出してチケット予約サイトを作ろうと思いました。
お客様の声も取り入れ、
□多機能で高額な予約システムはあるがシンプルで運営費が安価なwebサイト
□お客様にもログインシステムを導入し予約時の手間を減らしたい。
□東京のカオスの巣窟である小劇場らしい雰囲気のデザイン
この3点を実現するために制作いたしました。
私は俳優を諦めてしまいましたが、私を育ててもらった演劇に少しでも恩返しできたらと思って作りました。

## バージョン
Ruby 2.6.5  
Rails 5.2.5

## 機能一覧
- [ ] イベント投稿機能
- [ ] イベント予約機能
- [ ] 予約メール送信機能
- [ ] コメント機能
- [ ] 投稿一覧

## ログイン用アカウント
-主催者ユーザー<br>
mail:syusaisya@example.com<br>
password:password

-お客様ユーザー<br>
mail:okyakusama@example.com<br>
password:password

- [ ] 主催者は、マイページからイベントを立ち上げることができます。
投稿したイベントはマイページに表示され予約したお客様を一覧で見ることができます。


- [ ] お客様はイベントに対して予約することができ、
予約が完了すると新規登録時に登録したメールアドレスに完了メールが飛びます。
(予約したときの完了メールは主催者にも飛びます)
お客様のマイページから予約したイベントを確認することができます。
ログインしたユーザーはイベントの詳細ページにて質問をコメントすることができます。


![スクリーンショット 2020-11-04 15 03 45](https://user-images.githubusercontent.com/66770962/98075177-3f987c00-1eaf-11eb-9aab-fb85b64f61fc.png)
![スクリーンショット 2020-11-04 15 04 08](https://user-images.githubusercontent.com/66770962/98075187-4626f380-1eaf-11eb-9533-f8354d0c3edc.png)
![スクリーンショット 2020-11-04 15 04 27](https://user-images.githubusercontent.com/66770962/98075196-4921e400-1eaf-11eb-9ab9-72ee1b9e0ad9.png)


## システム構成
![sistem](https://user-images.githubusercontent.com/66770962/115526677-3ec39d00-a2cb-11eb-8bf1-036809f66e10.jpg)


## カタログ設計
https://docs.google.com/spreadsheets/d/1m7UpFY9MoG_pMLh4w_KYLdmSs0KF2odvffEuLwPeXDg/edit?usp=sharing
## テーブル定義書
https://docs.google.com/spreadsheets/d/1KEdW2tH9S1wpNSKqVse_X2AixDq9JVCDfXgH2hgvVWU/edit?usp=sharing
## ER図
https://docs.google.com/spreadsheets/d/1Fe-BGk8lzAL4q3I34sXO0InCnJF9WsSIBqFupleFAVI/edit?usp=sharing
## 画面遷移図
https://docs.google.com/spreadsheets/d/1TeoYdkVi9JheelVDqsU-LSDzKumtHRyv9aoJE9ZDw0c/edit?usp=sharing
## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1D4fZuvnU0kHW06haCUSL5URcz_IUb8-QsOlkY_mSuMA/edit?usp=sharing

## 使用予定Gem
* devise
* carrierwave
* mini_magick
* admin
* Ransack
* kaminari
* bootstrap
* faker

