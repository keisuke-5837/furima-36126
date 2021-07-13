require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できるとき' do
      it 'item_nameとitem_info、item_category_idとitem_sales_status_id、item_shipping_fee_status_idとitem_prefecture_id、item_scheduled_delivery_idとitem_priceが存在すれば出品できること' do
        expect(@item).to be_valid
      end
      it 'item_priceが7桁以下だと登録できる'do
        @item.item_price = '9999999'
        expect(@item).to be_valid
      end
    end
    context '出品できない' do
      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'imageが空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では出品できない'do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_infoが空では出品できない'do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it 'item_category_idが空では出品できない'do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end 
      it'item_sales_status_idが空では出品できない'do
        @item.item_sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status can't be blank")
      end
      it 'item_shipping_fee_status_idが空では出品できない'do
        @item.item_shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
      end
      it 'item_prefecture_idが空では出品できない'do
        @item.item_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture can't be blank")
      end
      it 'item_scheduled_delivery_idが空では出品できない'do
        @item.item_scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
      end
      it 'item_priceが空では出品できない'do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank", "Item price is not a number", "Item price is invalid")
      end
      it 'item_priceが８桁以上だと登録できない'do
        @item.item_price = 11111111
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
      end
      it 'item_priceが全角数字だと登録できない'do
        @item.item_price = '１１１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it 'item_priceが299円以下では登録できないこと'do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
      end
      it 'item_priceが半角英数混合では登録できないこと'do
        @item.item_price = 'a111'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it 'item_priceが半角英語だけでは登録できないこと'do
        @item.item_price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
    end
  end
end
