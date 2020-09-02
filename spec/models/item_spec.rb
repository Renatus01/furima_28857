require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
      
    end

    describe '商品出品機能' do
      context '商品出品機能がうまくいくとき' do
        it "item,explanation,price,image,category_id,status_id,delivery_id,area_id,day_id,user_id が存在すれば登録できること" do 
          expect(@item).to be_valid
        end
      end

      context '商品出品機能がうまくいかないとき' do
        it "itemが空では登録できないこと" do
          @item.item = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Item can't be blank")
        end

        it "explanationが空では登録できないこと" do
          @item.explanation = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Explanation can't be blank")
        end

        it "priceが空では登録できないこと" do
          @item.price = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it "priceが全角数字では登録できないこと" do
          @item.price = "３０００"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price は半角数字で入力してください。")
        end

        it "priceが範囲外では登録できないこと" do
          @item.price = 3
          @item.valid?
          expect(@item.errors.full_messages).to include("Price は範囲内で入力してください。")
        end

        it "priceが範囲外では登録できないこと" do
          @item.price = 123456789
          @item.valid?
          expect(@item.errors.full_messages).to include("Price は範囲内で入力してください。")
        end

        it "imageが空では登録できないこと" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it "category_idが選択されていないと登録できないこと" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end

        it "status_idが選択されていないと登録できないこと" do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Status must be other than 1")
        end

        it "delivery_idが選択されていないと登録できないこと" do
          @item.delivery_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery must be other than 1")
        end

        it "area_idが選択されていないと登録できないこと" do
          @item.area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Area must be other than 1")
        end

        it "day_idが選択されていないと登録できないこと" do
          @item.day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Day must be other than 1")
        end

      end
    end
  end
end
