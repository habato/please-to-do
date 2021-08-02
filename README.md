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