require 'rails_helper'

RSpec.describe OrderShip, type: :model do
  describe '配送先情報の保存' do
    before do
      @order_ship = FactoryBot.build(:order_ship)
    end

    it '全ての値が正しく保存されていれば保存できること' do
      expect(@order_ship).to be_valid
    end

    it 'priceが空だと保存できないこと' do
      @order_ship.price = nil
      @order_ship.valid?
      expect(@order_ship.errors.full_messages).to include("Price can't be blank")
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
      expect(@order_ship.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
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
      expect(@order_ship.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it 'phone_numberが空だと保存できないこと' do
      @order_ship.phone_number = nil
      @order_ship.valid?
      expect(@order_ship.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが12桁以上だと保存できないこと' do
      @order_ship.phone_number = '111111111111'
      @order_ship.valid?
      expect(@order_ship.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end

  end
end
