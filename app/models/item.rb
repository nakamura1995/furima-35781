class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  belongs_to :category
  belongs_to :day
  belongs_to :explanation
  belongs_to :prefecture
  belongs_to :status

  with_options presence: true do
    validates :category_id
    validates :days_id
    validates :name
    validates :explanation_id
    validates :prefectures_id
    validates :status_id
    validates :description
    validates :price, presence: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :image
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :explanation_id
    validates :days_id
    validates :status_id
    validates :prefectures_id
    validates :price, numericality: true
  end
end
