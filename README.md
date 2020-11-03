# README

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| birthday | string | null: false |

## items テーブル

| Column     | Type       | Options                        |
| ---------- | -----------| ------------------------------ |
| name       | string     | null: false                    |
| user_id    | references | null: false, foreign_key: true |
| info       | string     | null: false                    |
| category   | string     | null: false                    |
| sales      | string     | null: false                    |
| shippings  | string     | null: false                    |
| prefecture | string     | null: false                    |
| scheduled  | string     | null: false                    |
| price      | string     | null: false                    |

## transactions テーブル

| Column       | Type       | Options                        |
| ------------ | -----------| ------------------------------ |
| number       | string     | null: false                    |
| exp-month    | string     | null: false                    |
| exp-year     | string     | null: false                    |
| cvc          | string     | null: false                    |

## shippings テーブル

| Column       | Type       | Options                        |
| ------------ | -----------| ------------------------------ |
| postal-code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone-number | string     | null: false                    |
| user_id      | references | null: false, foreign_key: true |


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
