class Item < ApplicationRecord
  belongs_to :user
  has_one    :order
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_prefecture
  belongs_to :item_sales_status
  belongs_to :item_scheduled_delivery
  belongs_to :item_shipping_fee_status

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :item_category_id
    validates :item_sales_status_id
    validates :item_shipping_fee_status_id
    validates :item_prefecture_id
    validates :item_scheduled_delivery_id
  end
  with_options presence: true do
    validates :item_name
    validates :item_info
    validates :item_price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/}
    validates :image
  end
  has_one_attached :image
end
