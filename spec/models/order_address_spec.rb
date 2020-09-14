require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @order = FactoryBot.build(:order_address)
    end

    context '購入情報の保存がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @order.building_name = nil
        expect(@order).to be_valid
      end
    end

    context '購入情報の保存がうまくいかないとき' do
      it 'tokenが空だと保存できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと保存できないこと' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order.postal_code = 1_234_567
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid. Included hyphen(-)')
      end

      it 'prefectureを選択していないと保存できないこと' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefecture Select')
      end

      it 'cityは空でも空だと保存できないこと' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberは空だと保存できないこと' do
        @order.house_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberがハイフンを含まない番号でないと保存できないこと' do
        @order.phone_number = '090-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid. Not included hyphen(-)')
      end

      it 'phone_numberが12桁以上だと保存できないこと' do
        @order.phone_number = '090123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid. Not included hyphen(-)')
      end
    end
  end
end
