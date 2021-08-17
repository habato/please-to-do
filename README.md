# アプリケーション名：『PleaseToDo』
## 『PleaseToDo』
ToDo(すること)をplease(お願い)するアプリケーション。
「必ずやること」ではなく、「やってもらえたらありがたいこと」を投稿してお願いする。

# 概要
* ルーム内に投稿したリクエストを共有でき、完了したタスクを管理できる。

* 家族や友人など身近な人物、もしくは個人での利用を想定している。

* 「わざわざ人に頼むほどのことかな？」と思うようなことを気軽にお願いできるようにすることを目的としている。

* 個人でもToDoリストととして利用できる。

# 機能
* 共有したいユーザーとルームを作り「やってくれたらありがたいこと」や「いつかやろうと思っていること」をリクエストとして投稿し共有できる。共有するユーザーがいない場合は一人でもルームを作成できる。

* ルーム内に投稿したリクエストは一覧で表示され、リクエストごとに詳細ページに遷移できる。

* 詳細ページではリクエストの詳細を確認できるほか、コメントでの質問やコミュニケーションが可能。投稿したユーザに限りリクエストの編集・削除も可能になる。

* 達成したリクエストは詳細ページにある「完了」ボタンをクリックすることで「達成済み」となり、「達成済み」となったリクエストには「済」マークが表示され「完了」しているかどうかを一目で判断できる。

* ルームを削除すると紐づくリクエストも同時に削除される。

# 本番環境
## URL
```https://please-to-do.herokuapp.com/```
## Basic認証
* ID:sano
* Pass:sanosano
## テスト用アカウント
* Nickname:test
* Pass:test1111
# 制作背景(意図)
* 既存のタスク共有アプリは仕事などでの使用が想定されているため、ちょっとしたお願いをするにはハードルが高いと感じた。
* 「人に頼むほどのことかな？」と思うことを気軽にお願いできるようにしたい。
* 既存のチャットアプリでは古い投稿は流れていってしまいうため、頼まれたことを忘れてしまうことがある。
* 個人でも複数人でも利用できる実用性のあるアプリケーションを作りたいと考えた。
以上の点から気軽にタスクを共有できるアプリケーションがあれば便利だと考え作成。
# 要件
| 優先順位（3>2>1） | 機能                | 目的                         | 詳細                                                | ストーリー(ユースケース)                                                                    | 見積もり |
| --------------- | ------------------ | ---------------------------- | -------------------------------------------------- | --------------------------------------------------------------------------------------- | ------- |
| 3               | ユーザー管理機能      | ユーザーを管理するため          | ユーザーの新規登録/ログイン/ログアウトを可能にする          | ・ユーザー情報を保存して新規登録できる・保存した情報でログインできる・ログアウトボタンでログアウトできる | 8       |
| 3               | ルーム作成機能        | ルームを作成するため           | ルームの作成/削除を可能にする                            | ・情報を保存してルームを新規作成できる・削除ボタンで削除できる                                    | 8       |
| 3               | ルーム一覧表示機能    | ルームを一覧表示するため        | ログインユーザーが参加しているルーム名を一覧で表示する        | ・ユーザーがログインすると参加しているルーム名が一覧で表示される                                  | ５      |
| 3               | リクエスト投稿機能    | リクエストを投稿するため        | リクエスト情報の投稿を可能にする                          | ・情報を入力してリクエストを投稿すると情報が保存される                                           | 8      |
| 3               | リクエスト一覧表示機能 | リクエストを一覧表示するため     | ルーム内のリクエスト情報を一覧で表示する                   | ・ルームに入るとルーム内のリクエスト情報が一覧で表示される                                       | 5       |
| 3               | リクエスト詳細表示機能 | リクエストの詳細を表示するため   | リクエストの詳細を見られるページを表示する                  | ・リクエスト一覧ページのリクエストをクリックすると詳細ページが表示される                           | 5       |
| 2               | リクエスト情報編集機能 | リクエスト情報を編集するため     | リクエストを投稿したユーザーはリクエスト情報の編集を可能にする | ・リクエストを投稿したユーザーは編集ページで情報を入力/保存することで情報を編集できる               | 5       |
| 2               | リクエスト削除機能    | リクエストを削除するため         | リクエストを投稿したユーザーはリクエストの削除を可能にする    | ・リクエストを投稿したユーザーは詳細ページからリクエストの削除ができる                            | 3       |
| 3               | リクエスト完了機能    | リクエストが完了したか判断するため | 完了したリクエストに「済」と表示する                      | ・詳細ページから完了ボタンをクリックすると情報が保存される・完了したリクエストには「済」と表示される   | 6       |
| 2               | コメント機能         | リクエストにコメントするため      | 詳細ページでコメントの投稿/表示を可能にする                | ・詳細ページで情報を入力してコメントボタンをクリックする投稿できる・詳細ページにコメントが表示される | 5       |
| 1               | コメント削除機能      | コメントを削除するため           | コメントを投稿したユーザーはコメントの削除を可能にする       | ・コメントを投稿したユーザーはコメントを削除できる                                            | 3       |

# DEMO
## ログイン
[![Image from Gyazo](https://i.gyazo.com/fc598d2cc0ed7ccb4617a49cdbad51b9.gif)](https://gyazo.com/fc598d2cc0ed7ccb4617a49cdbad51b9)
* ログインするとトップページに遷移し、参加しているルームの一覧が表示される。
* ルーム作成ボタンから新規ルーム作成ページに遷移できる。
## 新規ルーム作成
[![Image from Gyazo](https://i.gyazo.com/41c605ea23d89af9b8000be6cbe24e94.gif)](https://gyazo.com/41c605ea23d89af9b8000be6cbe24e94)
* ルーム名と参加メンバーを入力し、ルーム作成ボタンをクリックするとルームが作成される。
* ルーム名をクリックするとルーム内のリクエスト情報が一覧表示される。
* リクエストがない場合はサンプルが表示されクリックするとリクエスト新規投稿画面に遷移する。
## 新規リクエスト投稿
[![Image from Gyazo](https://i.gyazo.com/55701ea37764c3ad96edf05e39b7ecf5.gif)](https://gyazo.com/55701ea37764c3ad96edf05e39b7ecf5)
* 必要な情報を入力し、送信ボタンをクリックすると投稿される。
* 画像を投稿しない場合は「NO IMAGE」と表示される。
## リクエストの編集
[![Image from Gyazo](https://i.gyazo.com/88c7ca7e3917f83d60318da80bea2998.gif)](https://gyazo.com/88c7ca7e3917f83d60318da80bea2998)
* リクエストをクリックすると詳細ページに遷移できる。
* 投稿したユーザーに限り編集ページに遷移でき、リクエスト情報を編集できる。
## コメントの投稿/削除
[![Image from Gyazo](https://i.gyazo.com/933838c4a6584f02ecb1dff9f4644bed.gif)](https://gyazo.com/933838c4a6584f02ecb1dff9f4644bed)
* 詳細ページではコメントを投稿することができる。
* 投稿ユーザーに限り、コメントを削除できる。
## リクエストの完了
[![Image from Gyazo](https://i.gyazo.com/196a4a42b0f3af7eb0c7e2dbf764e541.gif)](https://gyazo.com/196a4a42b0f3af7eb0c7e2dbf764e541)
* 完了ボタンをクリックすると「リクエスト完了」となり、一覧ページと詳細ページに「済」と表示される。
* 「済」と表示されたリクエストは編集/削除/コメントができなくなる。
## リクエストの削除
[![Image from Gyazo](https://i.gyazo.com/9d45376931242f240986dfe069f11693.gif)](https://gyazo.com/9d45376931242f240986dfe069f11693)
* 完了前のリクエストは投稿ユーザーに限り、削除ボタンで削除できる。
## ルームの削除
[![Image from Gyazo](https://i.gyazo.com/a6c44ac467a85b9c7b1e5d3943710cbb.gif)](https://gyazo.com/a6c44ac467a85b9c7b1e5d3943710cbb)
* ルームは削除ボタンで削除できる。
* ルームを削除すると紐づく情報も同時に削除される。
# 実装予定の機能
* ユーザー詳細機能
* ルームへの参加/退会機能
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
[![Image from Gyazo](https://i.gyazo.com/eda41d48b681ab3008896f21d695b00c.png)](https://gyazo.com/eda41d48b681ab3008896f21d695b00c)
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
