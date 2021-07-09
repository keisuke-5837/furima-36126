# テーブル設計

## usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| nickname           | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| date_of_birth      | integer | null: false |
