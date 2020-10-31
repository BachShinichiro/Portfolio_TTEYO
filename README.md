# README

## 概要
小劇場向けの公演予約アプリ

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
* ransack

## 要件
1.就業Termから少なくとも2つ
* コメント,devise

2.就業Termから少なくとも2つ
* ransack
