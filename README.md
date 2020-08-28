# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false              |
| password           | string | null: false              |
| encrypted_password | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first_name_reading | string | null: false              |
| last_name_reading  | string | null: false              |
| birthday           | date   | null: false              |


### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| item         | string     | null: false                   |
| explanation  | text       | null: false                   |
| price        | integer    | null: false                   |
| category_id  | integer    | null: false                   |
| status_id    | integer    | null: false                   |
| delivery_id  | integer    | null: false                   |
| area_id      | integer    | null: false                   |
| days_id      | integer    | null: false                   |
| user         | references | null: false,foreign_key: true |


### Association

- belongs_to :user
- has_one    :purchase


## purchases テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| product    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| purchase      | references | null: false, foreign_key: true |

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
