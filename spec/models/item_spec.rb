require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'image,name,info,category_id,sale_id,prefecture_id,scheduled_id,shipping_id,priceが存在すれば登録できること' do
      expect(@item).to be_valid
    end

    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では登録できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'infoが空では登録できない' do
      @item.info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end

    it 'priceが空では登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが300未満では登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it 'priceが9,999,999以上では登録できない' do
      @item.price = 10_000_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it 'category_idが1では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it 'sale_idが1では登録できない' do
      @item.sale_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Sale must be other than 1')
    end

    it 'prefecture_idが1では登録できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it 'scheduled_idが1では登録できない' do
      @item.scheduled_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Scheduled must be other than 1')
    end

    it 'shipping_idが1では登録できない' do
      @item.shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping must be other than 1')
    end

    it 'userが紐づいてないと保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
