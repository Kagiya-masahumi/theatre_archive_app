# README


## menu
* [アプリケーション概要](#アプリケーション概要)
* [アプリケーション名](#アプリケーション名)
* [URL](#URL)
* [テスト用アカウント](#テスト用アカウント)
* [利用方法](#利用方法)
* [目指した課題解決](#目指した課題解決)
* [実装した機能についての画像やGIFおよびその説明](#実装した機能についての画像やGIFおよびその説明)
* [実装予定の機能](#実装予定の機能)
* [データベース設計](#データベース設計)
* [ローカルでの動作方法](#ローカルでの動作方法)

<br>

# アプリケーション名
## オンライン演劇アーカイブ　『Theatre Earth』
<br>
<br>
<br>

# アプリケーション概要

- 個人ユーザーと団体ユーザーそれぞれでログインが可能
***

#### 個人ユーザー
- 公演動画の購入
- 「お気に入り」機能
- コメント機能
- マイページ有り

***

#### 団体ユーザー
- 公演映像の投稿 
- 公演の詳細情報を投稿
- 公演のフライヤーを投稿
- 公演の情報を編集、削除可能
- マイページ有り
<br>
<br>
<br>

# URL
https://theatre-archive-app.herokuapp.com/

# テスト用アカウント
## 個人ユーザー
- メールアドレス：user1@com
- パスワード：user11
## 団体ユーザー
- メールアドレス：gekidan1@com
- パスワード：gekidan1


# 利用方法
このアプリケーションは、オンライン演劇アーカイブです。過去に公演を行った作品を公開し、現地へ赴かずとも観劇出来るアプリケーションとなります。
アプリは登録無しでも使用できますが、公演や劇団の詳細を確認したい場合は新規登録をおすすめします。
登録は２種類で、公演の購入やコメントが出来る個人ユーザーと、作品の投稿や編集・削除が可能な団体ユーザーになります。
個人ユーザーでの新規登録の際はクレジットカードの登録が必須となります。ご注意ください。


# 目指した課題解決
<!-- このアプリケーションを通じて、どのような人の、どのような課題を解決しようとしているのかを記述。 -->

### 個人ユーザー
- 地方在住の演劇が好きな学生
- 夜忙しい、まとまった時間が取れない人
- 演劇文化が根付いていない土地（劇場等が遠方にしか無い）に住んでいる人
 **→地理的な制限が解消できる。**
- 一度購入したものは何度でも楽しめる
### 団体ユーザー
- 公演のたびに費用が掛かってしまう
- 予約者が来ないとその分収入はマイナス
  **→一度公開すればユーザーが購入できるので、公演以外でも収益が見込める。**
- 観劇したい人と本番日の予定が一致しないと集客を見込めない
**→オンラインでの観劇なので、ユーザーが観たいときに楽しめる**
- 基本的には一度限りの舞台
**→一度購入すれば、何度でも繰り返し観劇が可能**
- ある程度作品数はあるものの、ホームページなどを持っていない
**→マイページに投稿一覧が表示されるので、わざわざHP上でまとめる必要がない。**

# 洗い出した要件

- 作品詳細
- 画像投稿
- Cloudinaryの実装
- Herokuへのデプロイ
- 作品投稿機能（団体ユーザー）
- 作品編集機能（団体ユーザー）
- 作品削除機能（団体ユーザー）
- コメント機能（個人ユーザー）
- クレジットカード登録機能（個人ユーザー）
- 作品購入機能（個人ユーザー）
- お気に入り機能（個人ユーザー）
- マイページ機能（団体ユーザー・個人ユーザー）
- 新規登録・ログイン機能（団体ユーザー・個人ユーザー）
- 作品一覧機能（団体ユーザー・個人ユーザー）


# 実装した機能についての画像やGIFおよびその説明


- マイページ機能
劇団一覧から、各劇団のページに遷移できます
[![Image from Gyazo](https://i.gyazo.com/a03459709ac2da24da1f6606fd92c581.gif)](https://gyazo.com/a03459709ac2da24da1f6606fd92c581)



## 個人ユーザー
- 「お気に入り」機能
お気に入りとしてマイページに保存できます。
[![Image from Gyazo](https://i.gyazo.com/7645894bbcf87b02bbf1e67f1473c067.gif)](https://gyazo.com/7645894bbcf87b02bbf1e67f1473c067)


- コメント機能
動画にコメントが残せます。
[![Image from Gyazo](https://i.gyazo.com/d95a2b56fb8730ea0fc530cfdff3c38b.gif)](https://gyazo.com/d95a2b56fb8730ea0fc530cfdff3c38b)


- 購入機能
動画を購入できます
[![Image from Gyazo](https://i.gyazo.com/51a7d2767548ac644b1cb94a299d8fdb.gif)](https://gyazo.com/51a7d2767548ac644b1cb94a299d8fdb)


---

## 団体ユーザー
- 公演作品の投稿機能
作品を投稿できます。
[![Image from Gyazo](https://i.gyazo.com/4af7e34056294bb52c74e26c5f2a52b8.gif)](https://gyazo.com/4af7e34056294bb52c74e26c5f2a52b8)
↓
[![Image from Gyazo](https://i.gyazo.com/8f242a966016343222aa00ae092928eb.gif)](https://gyazo.com/8f242a966016343222aa00ae092928eb)
↓
[![Image from Gyazo](https://i.gyazo.com/f3af2c2fa1e6facd0a33fb56f4d9d45c.gif)](https://gyazo.com/f3af2c2fa1e6facd0a33fb56f4d9d45c)
- 投稿した作品の編集
投稿者本人のみ、作品の詳細情報を編集出来ます。
[![Image from Gyazo](https://i.gyazo.com/6b1622f3a13bc93c6b741598ac12faf0.gif)](https://gyazo.com/6b1622f3a13bc93c6b741598ac12faf0)
- 投稿作品の削除
投稿者本人のみ、作品を削除出来ます。
[![Image from Gyazo](https://i.gyazo.com/4b2c9726af7fa563e2b981da22e77604.gif)](https://gyazo.com/4b2c9726af7fa563e2b981da22e77604)


---



# 実装予定の機能
・パンくずリスト
。劇場とGoogleMapAPIの連携

# データベース設計
**ER図**
<img width="715" alt="スクリーンショット 2021-07-13 12 52 09" src="https://user-images.githubusercontent.com/78534551/125387715-4df14d00-e3d9-11eb-8f39-587b7d128443.png">

# 画面遷移図
![名称未設定 (1)](https://user-images.githubusercontent.com/78534551/125890518-c6c56333-ff3e-48ed-b9f6-d225d5ece797.png)



# ローカルでの動作方法
git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述。この時、アプリケーション開発に使用した環境を併記することを忘れないこと（パッケージやRubyのバージョンなど）。
|Gem
| -------
| ruby '2.6.6'
| 'rails', '~> 6.0.0'
| 'mysql2', '>= 0.4.4'
<br>

|gem                                | 用途                        |
|:--:|:--:|
| 'rspec-rails', '~> 4.0.0'         | #テストコード                |
| 'factory_bot_rails'               | 同上                        |
| 'faker'                           | 同上                        |
| 'devise'                          | ユーザー新規登録、ログイン      |
| 'pry-rails'                       | デバッグ用                   |
| 'mini_magick'                     | 画像                        |
| 'image_processing', '~> 1.2'      | 画像                        |
| "bulma-rails", "~> 0.9.1"         |フロントエンド                 |
| 'carrierwave'                     |動画のアップロード              |
| 'dotenv-rails'                    |環境変数の設定                 |
| 'figaro', '~> 1.1', '>= 1.1.1'    |同上                            |
| 'jquery-rails'                    |「お気に入り機能」実装時に使用    | 
| 'acts-as-taggable-on', '~> 7.0'   |タグ付け                      |
| 'payjp'                           |クレジットカード決算のため         |
| 'cloudinary'                      |クラウドサービス                |
| 'fog'                             |クラウドサービス用              |
| 'devise-i18n'                     |deviseの日本語化               |
| 'devise-i18n-views'               | 同上                         |
| 'activestorage-cloudinary-service'|アップロードしたメディアの管理     |

---


[menuへ戻る](#menu)








<!-- # テーブル設計

## users テーブル

| Column                | Type   | Options                      |
| --------              | ------ | -----------                  |
| nickname              | string | null: false                  |
| email                 | string | null: false,unique: true     |
| encrypted_password    | string | null: false                  |
| name                  | string | null: false                  |
| family_name           | string | null: false                  |



### Association

- has_many :comments, dependent: :destroy


## groups テーブル

| Column                | Type   | Options                      |
| --------              | ------ | -----------                  |
| name                  | string | null: false                  |
| email                 | string | null: false,unique: true     |
| encrypted_password    | string | null: false                  |
| chair_person          | string | null: false                  |



### Association
- has_many :performances, dependent: :destroy


## performance テーブル

| Column            | Type        | Options                            |
| --------          | ------      | -----------                        |
| title             | string      | null: false                        |
| explain           | text        | null: false                        |
| staff_name        | text        | null: false                        |
| acting            | text        | null: false                        |
| place             | string      | null: false                        |
| start_date        | date        | null: false                        |
| finish_date       | date        | null: false                        |
| groups            | references  | null: false, foreign_key: true     |


### Association

- has_many :comments 
- belongs_to :group



## comments テーブル

| Column         | Type        | Options                        |
| --------       | ------      | ---------                      |
| text           | text        | null: false                    |
| performance    | references  | null: false, foreign_key: true |
| user           | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :performance


## Favorite テーブル

| Column         | Type        | Options                        |
| --------       | ------      | -----------                    |
| performance    | references  | null: false, foreign_key: true |
| user           | references  | null: false, foreign_key: true |



### Association

- belongs_to :performance
- belongs_to :user



## Performance_order テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| performance   | references | null: false, foreign_key: true |

//### Association

- has_one :address
- belongs_to :user
- belongs_to :performance




 -->
