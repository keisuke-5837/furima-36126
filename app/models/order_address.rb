class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :item_prefecture_id, :city, :house_number, :building, :phone_number, :user_id, :item_id, :token
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :item_prefecture_id
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, item_prefecture_id: item_prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end