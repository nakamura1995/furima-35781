# README

## users table #ユーザー情報

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false,unique: true|
| encrypted_password | string              | null: false             |
| nickname           | string              | null: false             |
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| first_name_kana         | string              | null: false             |
| last_name_kana           | string              | null: false             |
| birthday            | date              | null: false



## Association

has_many :items
has_many :records


## items table #商品情報

 Column             | Type                | Options                 |
|-------------------|---------------------|-------------------------|
| name              | string              | null: false             |
| category_id          | integer              | null: false             |
| price             | integer             | null: false             |
| exhibitor_id         | string              | null: false             |
| explanation_id       | text             | null: false             |
| status_id            | integer             | null: false             |
| days_id              | integer              | null: false             |
| user              | reference           | foreign_key: true       |
## Association


has_one :record
belongs_to :user

## shippings table  #発送先情報

 Column             | Type                | Options                 |
|----------------|---------------------|-------------------------|
| postal code           | string              | null: false             |
| prefectures_id         | integer              | null: false             |
| municipalities      | string              | null: false             |
| address             | string              | null: false             |
| building name       | string              |                         |
| phone               | string              | null: false             |

## Association
belongs_to :record
belongs_to :item

## records table #購入記録

 Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| postal code         | string              | null: false             |
| prefectures         | string              | null: false             |
| municipalities      | string              | null: false             |
| fee_id              | integer             | null:false

## Association

has_many :shippings
belongs_to :shipping
belongs_to :user

