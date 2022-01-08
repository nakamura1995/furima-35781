require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できる時' do
      it '全ての項目が埋まっていれば出品できる' do
        expect(@item).to be_valid
      end

      it 'priceが300円なら出品できる' do
        @item.price = '300'
        expect(@item).to be_valid
      end
      it 'priceが9,999,999円なら出品できる' do
        @item.price = '9_999_999'
        expect(@item).to be_valid
      end
      it 'priceが半角なら出品できる' do
        @item.price = '300'
        expect(@item).to be_valid
      end
    end

    context '商品出品できない時' do
      it '商品の名前がなければ登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明がなければ登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーの情報がないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態の入力がないと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it '配送料の負担の情報がないと登録できない' do
        @item.explanation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it '発送元の地域の入力がないと登録できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数の情報がないと登録できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end

      it '価格の情報がないと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが9,999,999円以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが半角数字でないと出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが半角英数混合では登録できないこと' do
        @item.price = '300' + 'dollar'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが半角英語だけでは登録できないこと' do
        @item.price = 'threemillion'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it '商品価格が300円未満だと出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it '画像が空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
