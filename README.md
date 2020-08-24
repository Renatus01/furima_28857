# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_reading | string | null: false |
| last_name_reading  | string | null: false |
| year               | string | null: false |
| month              | string | null: false |
| date               | string | null: false |


### Association

- has_many :products
- has_many :purchases


## products テーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| product      | string     | null: false                   |
| explanation  | text       | null: false                   |
| price        | integer    | null: false                   |
| user_id      | references | null: false,foreign_key: true |


### Association

- belongs_to :users
- has_one    :purchases


## purchases テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| product    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one    :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | references | null: false, foreign_key: true |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| prefecture    | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase











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
