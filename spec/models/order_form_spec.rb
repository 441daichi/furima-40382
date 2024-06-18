require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての情報が正しく入力されていれば保存できる' do
        expect(@order_form).to be_valid
      end
      it '郵便番号が[3桁+ハイフン+4桁]であれば保存できる' do
        @order_form.postcode = '123-4567'
        expect(@order_form).to be_valid
      end
      it '都道府県が[---]以外なら保存できる' do
        @order_form.prefecture_id = 1
        expect(@order_form).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @order_form.city = '丸亀市'
        expect(@order_form).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @order_form.block = '723-1'
        expect(@order_form).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_form.building = nil
        expect(@order_form).to be_valid
      end
      it '電話番号が10桁以上11桁以内の半角数値であれば保存できる' do
        @order_form.phone_number = '09011223344'
        expect(@order_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it '郵便番号が空だと登録できない' do
        @order_form.postcode = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号が[3桁+ハイフン+4桁]でなければ保存できない' do
        @order_form.postcode = '1234-567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end
      it '都道府県が[---]だと保存できない' do
        @order_form.prefecture_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できない' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できない' do
        @order_form.block = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Block can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できない' do
        @order_form.phone_number = '090-1122-3344'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が9桁以下だと保存できない' do
        @order_form.phone_number = '090112233'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が12桁以上だと保存できない' do
        @order_form.phone_number = '090112233445'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
      it 'トークンが空だと保存できないこと' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
