require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email,password,encrypted_password,first_name,last_name,first_name_reading,last_name_reading,birthday が存在すれば登録できること" do 
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空では登録できないこと" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できないこと" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
     end

      it "passwordが空では登録できないこと" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
       end

      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "test1"
        @user.password_confirmation = "test1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "first_nameが空では登録できないこと" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "first_nameが全角でないと登録できないこと" do
        @user.first_name = "Yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角で入力してください。")
      end

      it "last_nameが空では登録できないこと" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "last_nameが全角でないと登録できないこと" do
        @user.last_name = "Taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は全角で入力してください。")
      end

      it "first_name_readingが空では登録できないこと" do
        @user.first_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end

      it "first_name_readingが全角カナでない登録できないこと" do
        @user.first_name_reading = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading は全角カタカナで入力して下さい。")
      end

      it "last_name_readingが空では登録できないこと" do
        @user.last_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end

      it "last_name_readingが全角カナでないと登録できないこと" do
        @user.last_name_reading = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading は全角カタカナで入力して下さい。")
      end

      it "birthdayが空では登録できないこと" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      # it "birthdayが1930年以前では登録できないこと" do
      #   @user.birthday = "1929-12-31"
      #   binding.pry
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include("Birthday can't be registered")
      # end

      # it "birthdayが2015年以降では登録できないこと" do
      #   @user.birthday = "2016-01-01"
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include("Birthday can't be registered")
      # end
      
    end
  end
end
