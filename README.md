# README

## users table #ユーザー情報

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| encrypted_password | string              | null: false             |
| nickname           | string              | null: false             |


## Association

has_many :items
has_many :records
has_many :shippings

## items table #商品情報

 Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| name              | string              | null: false             |
| category          | string              | null: false             |
| price             | string              | null: false             |
| exhibitor         | string              | null: false             |
| explanation       | string              | null: false             |
| status            | string              | null: false             |
| image             | string              | null: false             |
| days              | string              | null: false             |

## Association

belongs_to :shippings
has_one :records

## shippings table  #出品先情報

 Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| name           | string              | null: false             |
| image          | string              | null: false             |
| price          | string              | null: false             |
| fee            | string              | null: false             |

## Association
has_many :records
belongs_to :items

## records table #購入記録

 Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| postal code         | string              | null: false             |
| prefectures         | string              | null: false             |
| municipalities      | string              | null: false             |
| address             | string              | null: false             |
| building name       | string              | null: false             |
| phone               | string              | null: false             |

## Association

belongs_to :items
belongs_to :shippings


