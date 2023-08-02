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

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association
- has_many :items
- has_many :buying_records


## items テーブル
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| description        | string  | null: false |
| item_name          | string  | null: false |
| picture            | img     | null: false |
| category           | string  | null: false |
| condition          | string  | null: false |
| Delivery_charge    | integer | null: false |
| sender             | string  | null: false |
| price              | integer | null: false |
| days_to_ship       | integer | null: false |

### Association
- belongs_to :users
- has_many :buying_records
- has_one :address


## buying_records テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| users_id           | integer  | null: false |

### Association
- belongs_to :items


## address テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| post_code          | string  | null: false |
| prefectures        | string  | null: false |
| municipalities     | string  | null: false |
| house_number       | integer | null: false |
| Building_name      | string  | null: false |
| Delivery charge    | integer | null: false |
| tel                | integer | null: false |

### Association
- has_one :address