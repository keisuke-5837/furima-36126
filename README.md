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

| Column                      | Type       | Options                       |
| --------------------------- | ---------- | ----------------------------- |
| user                        | references | null: false, foreign_key: true|
| item_name                   | string     | null: false                   |
| item_info                   | text       | null: false                   |
| item_category               | string     | null: false                   |
| item_sales_status_id        | integer    | null: false                   |
| item_shipping-fee-status_id | integer    | null: false                   |
| item_prefecture_id          | integer    | null: false                   |
| item_scheduled-delivery_id  | integer    | null: false                   |
| item_price_id               | integer    | null: false                   |

### Association
belongs_to :user
has_one    :order

## ordersテーブル

| Column                   | Type       | Options                       |
| ------------------------ | ---------- | ----------------------------- |
| user                     | references | null: false, foreign_key: true|
| item                     | references | null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one    :address

## addressesテーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| order         | references | null: false, foreign_key: true|
| prefecture_id | string     | null: false                   |
| prefecture_id | string     | null: false                   |
| city          | string     | null: false                   |
| house_number  | integer    | null: false                   |
| building      | string     |                               |
| phone_number  | string     | null: false                   |

### Association
belongs_to :order


