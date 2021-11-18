class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nickname, presence: true
         validates :birthday, presence: true

         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
         
         validates_format_of :first_name, presence: true,with: /\A[ぁ-んァ-ン一-龥]+\z/
         validates_format_of :last_name, presence: true, with: /\A[ぁ-んァ-ン一-龥]+\z/
       
         validates :first_name_kana, presence:true
         validates :last_name_kana, presence: true
         validates_format_of :first_name_kana, with: /\A[ァ-ヶー－]+\z/
         validates_format_of :last_name_kana,  with: /\A[ァ-ヶー－]+\z/
end
