class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions  
  belongs_to :category
  belongs_to :day
  belongs_to :explanation
  belongs_to :prefecture
  belongs_to :status

  with_options presence: true do
    validates :category_id
    validates :day_id
    validates :name
    validates :explanation_id
    validates :prefecture_id
    validates :status_id
    validates :description
    validates :price, presence: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :image
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :explanation_id
    validates :day_id
    validates :status_id
    validates :prefecture_id
    validates :price, numericality: true
  end
end
