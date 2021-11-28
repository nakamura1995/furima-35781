class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
has_one :record
belongs_to :user
belongs_to :category
belongs_to :days
belongs_to :explanation
belongs_to :prefectures
belongs_to :status

validates :category_id, presence: true
validates :days_id, presence: true
validates :name, presence: true
validates :explanation_id, presence: true
validates :category_id, presence: true
validates :prefectures_id, presence: true
validates :status_id, presence: true
validates :description, presence: true
validates :price, presence: true

validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}
end
