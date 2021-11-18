require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

     describe "ユーザー新規登録" do
       context '新規登録できる時' do
          it '全ての項目が存在すれば登録できる' do
            expect(@user).to be_valid
          end

         it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
           @user.password = 'aa123456'
           @user.password_confirmation = 'aa123456'
           expect(@user).to be_valid
       end
       end
      
      context '新規登録できない場合' do       
      it 'nicknameが空では登録できない' do          
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
    
      it 'emailが空では登録できない' do   
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
      end 
    
      it 'emailに＠が含まれていないと登録できない'do      
      @user.email = "@"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
      end
    
      it 'passwordが空では登録できない' do        
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
        
        it 'password:半角英数混合(半角英語のみ)でなければ登録できない' do
          @user.password = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")       
       
      end 
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end    
      it '生年月日が空では登録できない' do
        @user.birthday =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '名前(全角)は苗字と名前がなければ登録できない' do
        @user.first_name = ""
        @user.last_name = ""
        expect(@user.errors.full_messages).to include()
    end
    it '名前(全角カナ)は苗字と名前がなければ登録できない' do
      @user.first_name_kana = ""
      @user.last_name_kana = ""
      expect(@user.errors.full_messages).to include()
  end
  it '名前は全角でなければ登録できない' do
      @user.first_name = "中村"
      @user.last_name = "優汰"
      expect(@user.errors.full_messages).to include()
    end
    it'名前（カナ）は全角カナでなければ登録できない' do
      @user.first_name_kana = "ナカムラ"
      @user.last_name_kana = "ユウタ"
      expect(@user.errors.full_messages).to include()
    end
end
end
end
