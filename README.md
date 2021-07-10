# テーブル設計

## usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| nickname           | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_kana    | string  | null: false |
| last_name_kana     | string  | null: false |
| birth_date         | date    | null: false |

### Association
has_many :items
has_many :orders

## itemsテーブル

| Column                   | Type      | Options                       |
| ------------------------ | --------- | ----------------------------- |
| user                     | reference | null: false, foreign_key: true|
| image                    | text      | null: false                   |
| item_name                | text      | null: false                   |
| item_info                | text      | null: false                   |
| item_category            | string    | null: false                   |
| item_sales_status        | string    | null: false                   |
| item_shipping-fee-status | string    | null: false                   |
| item_prefecture          | string    | null: false                   |
| item_scheduled-delivery  | integer   | null: false                   |
| item_price               | integer   | null: false                   |

### Association
belongs_to :user
has_one    :order

## ordersテーブル

| Column                   | Type      | Options                       |
| ------------------------ | --------- | ----------------------------- |
| user                     | reference | null: false, foreign_key: true|
| item                     | reference | null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one    :address

## addressテーブル

| Column       | Type      | Options                       |
| ------------ | --------- | ----------------------------- |
| order        | reference | null: false, foreign_key: true|
| postal_code  | integer   | null: false                   |
| prefecture   | string    | null: false                   |
| city         | string    | null: false                   |
| addresses    | integer   | null: false                   |
| building     | string    | null: false                   |
| phone_number | integer   | null: false                   |

### Association
belongs_to :order


