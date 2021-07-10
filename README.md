# テーブル設計

## usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birth_date         | date    | null: false               |

### Association
has_many :items
has_many :orders

## itemsテーブル

| Column                      | Type       | Options                       |
| --------------------------- | ---------- | ----------------------------- |
| user                        | references | null: false, foreign_key: true|
| item_name                   | string     | null: false                   |
| item_info                   | text       | null: false                   |
| item_category_id            | integer    | null: false                   |
| item_sales_status_id        | integer    | null: false                   |
| item_shipping_fee-status_id | integer    | null: false                   |
| item_prefecture_id          | integer    | null: false                   |
| item_scheduled_delivery_id  | integer    | null: false                   |
| item_price                  | integer    | null: false                   |

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

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| order              | references | null: false, foreign_key: true|
| postal_code        | string     | null: false                   |
| item_prefecture_id | integer    | null: false                   |
| city               | string     | null: false                   |
| house_number       | string     | null: false                   |
| building           | string     |                               |
| phone_number       | string     | null: false                   |

### Association
belongs_to :order


