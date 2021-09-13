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
| exhibitor_id         | integer              | null: false             |
| explanation_id       | integer             | null: false             |
| status_id            | integer             | null: false             |
| days_id              | integer              | null: false             |
| user              | references           | foreign_key: true       |
| description       | text             | nul: false               
## Association


has_one :record
belongs_to :user

## shippings table  #発送先情報

 Column             | Type                | Options                 |
|----------------|---------------------|-------------------------|
| postal_code           | string              | null: false             |
| prefectures_id         | integer              | null: false             |
| municipalities      | string              | null: false             |
| address             | string              | null: false             |
| building_name       | string              |                         |
| phone               | string              | null: false             |
| record              | references          | foreign_key: true       |  

## Association
belongs_to :records


## records table #購入記録

 Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user        | references              | foreign_key: true             |
| item         | references              | foreign_key: true           |


## Association

belongs_to :item
belongs_to :user
has_one :shipping

