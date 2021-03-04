# README

## 概要
小劇場向けの公演予約アプリ

## リンク
http://35.72.57.84/

## コンセプト
シンプルな操作で公演情報やお客様の予約情報を管理できます。

## バージョン
Ruby 2.6.5  
Rails 5.2.4

## 機能一覧
- [ ] イベント投稿機能
- [ ] イベント予約機能
- [ ] メール送信機能
- [ ] 掲示板コメント機能

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
