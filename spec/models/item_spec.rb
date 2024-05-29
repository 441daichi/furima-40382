require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品登録' do
    context '出品登録ができるとき' do
      it 'すべての入力事項が存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'カテゴリーが[---]以外なら登録できる' do
        @item.category_id = 1
        expect(@item).to be_valid
      end
      it '商品の状態が[---]以外なら登録できる' do
        @item.item_status_id = 1
        expect(@item).to be_valid
      end
      it '配送料の負担が[---]以外なら登録できる' do
        @item.shipping_cost_id = 1
        expect(@item).to be_valid
      end
      it '発送元の地域が[---]以外なら登録できる' do
        @item.prefecture_id = 1
        expect(@item).to be_valid
      end
      it '発送までの日数が[---]以外なら登録できる' do
        @item.shipping_date_id = 1
        expect(@item).to be_valid
      end
    end

    context '出品ができないとき' do
      it '商品に紐づくユーザーが存在しなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it '画像がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空だと登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーが[---]だと登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it '商品の状態が[---]だと登録できない' do
        @item.item_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status must be other than 0")
      end
      it '配送料の負担が[---]だと登録できない' do
        @item.shipping_cost_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost must be other than 0")
      end
      it '発送元の地域が[---]だと登録できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it '発送までの日数が[---]だと登録できない' do
        @item.shipping_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date must be other than 0")
      end
      it '価格が300円未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が9,999,999円を超えると登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
