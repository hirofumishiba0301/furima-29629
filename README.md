# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| birthday           | date   | null: false |
| nickname           | string | null: false |
| last-name          | string | null: false |
| first-name         | string | null: false |
| last-name-kana     | string | null: false |
| first-name-kana    | string | null: false |

### Association
- has_many :orders
- has_many :items

## items テーブル

| Column        | Type       | Options                        |
| ------------- | -----------| ------------------------------ |
| name          | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| info          | text       | null: false                    |
| category_id   | integer    | null: false                    |
| sales_id      | integer    | null: false                    |
| shippings_id  | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| scheduled_id  | integer    | null: false                    |
| price         | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :order

## orders テーブル

| Column       | Type       | Options                        |
| ------------ | -----------| ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item
-has_one :shipping


## shippings テーブル

| Column        | Type       | Options                        |
| ------------- | -----------| ------------------------------ |
| postal-code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone-number  | string     | null: false                    |
| transaction   | references | null: false, foreign_key: true |

### Association

-belongs_to :order


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
