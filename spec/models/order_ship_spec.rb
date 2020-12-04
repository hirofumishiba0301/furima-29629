require 'rails_helper'

RSpec.describe OrderShip, type: :model do
  describe '配送先情報の保存' do
    before do
      @order_ship = FactoryBot.build(:order_ship) do |s|
        @user = FactoryBot.build(:user)
        @item = FactoryBot.build(:item)
        s.user_id = @user.id
        s.item_id = @item.id
      end
    end

    context '配送先情報が正しく保存できるとき' do
      it '全ての値が正しく保存されていれば保存できること' do
        expect(@order_ship).to be_valid
      end

      it 'buildingが空でも保存できること' do
        @order_ship.building = nil
        expect(@order_ship).to be_valid
      end
    end

    context '配送先情報が正しく保存できないとき' do
      it 'user_idが空だと保存できないこと' do
        @order_ship.user_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できないこと' do
        @order_ship.item_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空だと保存できないこと' do
        @order_ship.token = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと保存できないこと' do
        @order_ship.postal_code = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにーが含まれてないと保存できないこと' do
        @order_ship.postal_code = '1234567'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'addressが空だと保存できないこと' do
        @order_ship.address = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Address can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @order_ship.city = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("City can't be blank")
      end

      it 'prefecture_idが空だと保存できないこと' do
        @order_ship.prefecture_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが１だと保存できないこと' do
        @order_ship.prefecture_id = 1
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'phone_numberが空だと保存できないこと' do
        @order_ship.phone_number = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが12桁以上だと保存できないこと' do
        @order_ship.phone_number = '111111111111'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
    end
  end
end
