# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| birthday           | date   | null: false |
| nickname           | string | null: false |

### Association
- has_one :items_history
- has_one :item, through: items_history

## items テーブル

| Column     | Type       | Options                        |
| ---------- | -----------| ------------------------------ |
| name       | string     | null: false                    |
| user       | references | null: false, foreign_key: true |
| info       | text       | null: false                    |
| category   | integer    | null: false                    |
| sales      | integer    | null: false                    |
| shippings  | integer    | null: false                    |
| prefecture | integer    | null: false                    |
| scheduled  | integer    | null: false                    |
| price      | integer    | null: false                    |

### Association

- belongs_to :items_history

## items_histories テーブル

| Column       | Type       | Options                        |
| ------------ | -----------| ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-has_one :item
-has_one :shipping


## shippings テーブル

| Column       | Type       | Options                        |
| ------------ | -----------| ------------------------------ |
| postal-code  | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone-number | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

-belongs_to :items_history


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
