# テーブル設計

## users テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| name         | string | null: false |
| name_reading | string | null: false |
| dob          | string | null: false |


### Association

- has_many :products
- has_many :purchases


## products テーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| product      | string     | null: false                   |
| price        | string     | null: false                   |
| category_id  | string     | null: false                   |
| status_id    | string     | null: false                   |
| delivery_id  | string     | null: false                   |
| area_id      | string     | null: false                   |
| days_id      | string     | null: false                   |
| user_id      | references | null: false,foreign_key: true |


### Association

- belongs_to :users
- has_one    :purchases


## purchases テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| product_id | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :products
- has_one    :addresses

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | references | null: false, foreign_key: true |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: false                    |
| prefecture_id | references | null: false, foreign_key: true |

### Association

- belongs_to :purchases











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
