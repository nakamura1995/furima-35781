require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
end

describe 'ユーザー新規登録' do
  it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
  end
  it 'nicknameが空では登録できない' do
    user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
       user.valid?
  end
  it 'emailが空では登録できない' do
  end
  it 'passwordが空では登録できない' do
  end
  it 'passwordとpassword_confirmationが不一致では登録できない' do
  end
  it 'password:半角英数混合(半角英語のみ)' do
    @user.password = 'aaaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
  end
  it '重複したemailが存在する場合登録できない' do
  end
  it 'passwordが5文字以下では登録できない' do
  end
end
end

