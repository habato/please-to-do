# アプリケーション名：『PleaseToDo』
## 『PleaseToDo』
ToDo(すること)をplease(お願い)するアプリケーション。
「必ずやること」ではなく、「やってもらえたらありがたい」レベルのことを投稿しお願いする。

# 概要
* ルーム内に投稿したリクエストを共有でき、完了したタスクを管理できる。

* 家族や友人など身近な人物、もしくは個人での利用を想定している。

* 「わざわざ人に頼むほどのことかな？」と思うようなことを気軽に共有できるようにすることを目的としている。

* 個人でもToDoリストととして利用できる。

# 本番環境
## URL
https://please-to-do.herokuapp.com/
## Basic認証
* ID:sano
* Pass:sanosano
## テスト用アカウント
* Nickname : test
* Pass : test1111
# 制作背景(意図)
* 既存のタスク共有アプリは仕事などでの使用が想定されているため、ちょっとしたお願いをするにはハードルが高いと感じた。
* 「人に頼むほどのことかな？」と思うことを気軽に共有できるようにしたいと考えた。
* 既存のチャットアプリでは古い投稿は流れていってしまいうため、頼まれたことを忘れてしまうことがある。
* 個人でも複数人でも利用できる実用性のあるアプリケーションを作りたいと考えた。  

以上の点から気軽にタスクを共有できるアプリケーションがあれば便利だと考え作成。
# 要件
| 優先順位（3>2>1） | 機能                | 目的                         | 詳細                                                               | ストーリー(ユースケース)                                                                                  | 見積もり時間 |
| --------------- | ------------------ | ---------------------------- | ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------| ------- |
| 3               | ユーザー管理機能      | ユーザーを管理するため          | ユーザーの新規登録/ログイン/ログアウトを可能にする                         | ・ユーザー情報を保存して新規登録できる・保存した情報でログインできる・ログアウトボタンでログアウトできる               | 8       |
| 3               | ルーム作成機能        | ルームを作成するため           | ルームの作成/削除を可能にする                                           | ・情報を保存してルームを新規作成できる・削除ボタンで削除できる                                                  | 8       |
| 3               | ルーム一覧表示機能    | ルームを一覧表示するため        | ログインユーザーが参加しているルーム名を一覧で表示する                       | ・ユーザーがログインすると参加しているルーム名が一覧で表示される                                                | ５      |
| 3               | リクエスト投稿機能    | リクエストを投稿するため        | リクエスト情報の投稿を可能にする                                         | ・情報を入力してリクエストを投稿すると情報が保存される                                                         | 8      |
| 3               | リクエスト一覧表示機能 | リクエストを一覧表示するため     | ルーム内のリクエスト情報を一覧で表示する                                  | ・ルームに入るとルーム内のリクエスト情報が一覧で表示される                                                     | 5       |
| 3               | リクエスト詳細表示機能 | リクエストの詳細を表示するため   | リクエストの詳細を見られるページを表示する                                 | ・リクエスト一覧ページのリクエストをクリックすると詳細ページが表示される                                         | 5       |
| 2               | リクエスト情報編集機能 | リクエスト情報を編集するため     | リクエストを投稿したユーザーはリクエスト情報の編集を可能にする                | ・リクエストを投稿したユーザーは編集ページで情報を入力/保存することで情報を編集できる                             | 5       |
| 2               | リクエスト削除機能    | リクエストを削除するため         | リクエストを投稿したユーザーはリクエストの削除を可能にする                   | ・リクエストを投稿したユーザーは詳細ページからリクエストの削除ができる                                          | 3       |
| 3               | リクエスト完了機能    | リクエストが完了したか判断するため | 完了したリクエストに「済」と表示する                                     | ・詳細ページから完了ボタンをクリックすると情報が保存される・完了したリクエストには「済」と表示される                 | 6       |
| 2               | コメント機能         | リクエストにコメントするため      | 詳細ページでコメントの投稿/表示を可能にする                               | ・詳細ページで情報を入力してコメントボタンをクリックする投稿できる・詳細ページにコメントが表示される                 | 5       |
| 1               | コメント削除機能      | コメントを削除するため           | コメントを投稿したユーザーはコメントの削除を可能にする                      | ・コメントを投稿したユーザーはコメントを削除できる                                                          | 3       |
| 2               | ユーザー検索機能      | ユーザーを検索するため           | 検索バーでニックネームを検索すると一致するユーザーを一覧表示するページに遷移する | ・検索バーでニックネームを検索すると一致するユーザーを一覧表示するページに遷移する                               | 3       |
| 2               | フォロー機能          | ユーザーに関係性をもたせるため    | ユーザーをフォロー/アンフォロー可能にする                                 | ・検索で一覧表示されたユーザーのフォローボタンをクリックするをフォローできる・もう一度クリックするとアンフォローできる | 8       |

# DEMO
## ログイン
[![Image from Gyazo](https://i.gyazo.com/ea7215bdb169ed0b5e1a31b0027bf62d.gif)](https://gyazo.com/ea7215bdb169ed0b5e1a31b0027bf62d)
* ログインするとトップページに遷移し、参加しているルームの一覧が表示される。
* ルーム名をクリックするとルーム内のリクエストが一覧表示される。
## 新規リクエスト投稿
[![Image from Gyazo](https://i.gyazo.com/f34848c070e8b42247597795c8d2067f.gif)](https://gyazo.com/f34848c070e8b42247597795c8d2067f)
* 必要な情報を入力し、「送信」ボタンをクリックするとリクエストが投稿される。
* リクエストをクリックすると詳細ページに遷移できる。
* 詳細ページでは投稿したユーザーに限り、リクエスト情報の編集/削除が行える。
## コメントの投稿/削除
[![Image from Gyazo](https://i.gyazo.com/9f46fd815248637eca2eba881020b47c.gif)](https://gyazo.com/9f46fd815248637eca2eba881020b47c)
* 詳細ページではコメントを投稿することができる。
* 投稿ユーザーに限り、コメントを削除できる。
## リクエストの完了
[![Image from Gyazo](https://i.gyazo.com/00e3bd98d3a00b559b66ed83e30a66c1.gif)](https://gyazo.com/00e3bd98d3a00b559b66ed83e30a66c1)
* 「完了」ボタンをクリックすると「リクエスト完了」となり、一覧ページと詳細ページに「済」と表示される。
* 「済」と表示されたリクエストは削除のみ、行うことができる。
## ユーザーフォロー
[![Image from Gyazo](https://i.gyazo.com/4ceb2a92b067de5ea7d6153b433849a6.gif)](https://gyazo.com/4ceb2a92b067de5ea7d6153b433849a6)
* ユーザー詳細ページでフォロー/フォロワーを確認でき、フォロー/アンフォローできる。
* 検索バーでニックネームを検索すると一致するユーザーを検索できる。
* 検索で表示したユーザーをフォローできる。
## 新規ルーム作成
[![Image from Gyazo](https://i.gyazo.com/9d50c47b708b38809eea5611f17b8b37.gif)](https://gyazo.com/9d50c47b708b38809eea5611f17b8b37)
* ルーム名と参加メンバーを選択し、「ルーム作成」ボタンをクリックするとルームが作成される。
* 参加メンバーはログインユーザーがフォローしているユーザーから選択することができる。
## ルームメンバー招待
[![Image from Gyazo](https://i.gyazo.com/7ce7dac87a44885c1ed4667c7c6a1e71.gif)](https://gyazo.com/7ce7dac87a44885c1ed4667c7c6a1e71)
* ルーム詳細ページではルームメンバーの確認ができる。
* 「メンバー招待」から、ログインユーザーがフォローしているユーザーを招待できる。
* 「退出」ボタンでルームを退出することができる。
## ルームの削除
[![Image from Gyazo](https://i.gyazo.com/d4b352dd6151bae724d31e09f9069124.gif)](https://gyazo.com/d4b352dd6151bae724d31e09f9069124)
* ルーム詳細ページの「ルームを削除する」ボタンで削除できる。
* ルームを削除すると紐づく情報も同時に削除される。
# 実装予定の機能
* 画像のプレビュー機能
* コメントの非同期通信

# 開発環境
## バックエンド
Ruby, Ruby on Rails

## フロントエンド
HTML, CSS

## データベース
MySQL, SequelPro

## ソース管理
GitHub, GitHubDesktop

## テスト
RSpec

## エディタ
VSCode
# データベース設計

## ER図
[![Image from Gyazo](https://i.gyazo.com/181a85b192981730bc1abd0eba9cc6d8.png)](https://gyazo.com/181a85b192981730bc1abd0eba9cc6d8)
## テーブル設計
## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |

### Association

- has_many :requests
- has_many :completions
- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :comments

- has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
- has_many :followers, through: :reverse_of_relationships, source: :follower
- has_many :relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
- has_many :followings, through: :relationships, source: :followed

## requests テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| content          | text       | null: false                    |
| user             | references | null: false, foreign_key: true |
| room             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :completion
- belongs_to :room
- has_many   :comments

## completions テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| request | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :request

## rooms テーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| name   | string     | null: false |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :requests

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| request | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :request

## relationships テーブル

| Column      | Type    | Options |
| ----------- | ------- | ------- |
| follower_id | integer |         |
| followed_id | integer |         |

### Association

- belongs_to :follower, class_name: 'User'
- belongs_to :followed, class_name: 'User'