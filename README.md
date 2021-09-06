# README

## users table #ユーザー情報

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false,unique: true|
| encrypted_password | string              | null: false             |
| nickname           | string              | null: false             |
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| nickname           | string              | null: false             |
| first_name_kana         | string              | null: false             |
| last_name_kana           | string              | null: false             |
| birthday            | string              | null: false



## Association

has_many :items
has_many :records


## items table #商品情報

 Column             | Type                | Options                 |
|-------------------|---------------------|-------------------------|
| name              | string              | null: false             |
| category_id          | integer              | null: false             |
| price             | string              | null: false             |
| exhibitor         | string              | null: false             |
| explanation       | string              | null: false             |
| status_id            | integer             | null: false             |
| days_id              | integer              | null: false             |
| id                | reference           | foreign_key: true       |
## Association

belongs_to :shippings
has_one :records
belongs_to :users

## shippings table  #発送先情報

 Column             | Type                | Options                 |
|----------------|---------------------|-------------------------|
| postal code           | string              | null: false             |
| prefectures         | string              | null: false             |
| municipalities      | string              | null: false             |
| address             | string              | null: false             |
| building name       | string              |                         |
| phone               | string              | null: false             |

## Association
has_many :records
belongs_to :items

## records table #購入記録

 Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| postal code         | string              | null: false             |
| prefectures         | string              | null: false             |
| municipalities      | string              | null: false             |


## Association

belongs_to :items
belongs_to :shippings


