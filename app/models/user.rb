class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         validates :nickname, presence: true
         validates :birthday, presence: true
         validates :email, confirmation: true
         validates :password, format: { with: /\A(?=.&#042;?[a-z])(?=.&#042;?\d)[a-z\d]+\z/i }
         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :first_name_kana, 
         #validates_format_of :first_name_kana, with: /\p{katakana}/
         #validates_format_of :last_name_kana,  with: /\p{katakana}/
end
