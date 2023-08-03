# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birth_day          | integer | null: false |


### Association
- has_many :items
- has_many :buying_records


## items テーブル
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| description        | text    | null: false |
| item_name          | string  | null: false |
| category_id        | string  | null: false |
| condition_id       | string  | null: false |
| delivery_charge_id | integer | null: false |
| sender_id          | string  | null: false |
| price              | integer | null: false |
| days_to_ship_id    | integer | null: false |
| user_id            | integer | null: false |

### Association
- belongs_to :users
- has_many :buying_records
- has_one :address


## buying_records テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| user_id           | integer  | null: false |

### Association
- belongs_to :items
- has_one :address


## address テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| post_code          | string  | null: false |
| sender_id          | string  | null: false |
| municipalities     | string  | null: false |
| house_number       | string  | null: false |
| building_name      | string  | null: false |
| delivery_charge    | string  | null: false |
| tel                | string  | null: false |

### Association
- has_one :items
- has_one :buying_records