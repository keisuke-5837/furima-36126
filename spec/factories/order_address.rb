FactoryBot.define do
  factory :order_address do
    postal_code        {'123-4567'}
    item_prefecture_id { 2 }
    city               {'新宿区'}
    house_number       {'六麓荘1-1-1'}
    building           {'六本木ヒルズ'}
    phone_number       { '09012345678' }
    token              {"tok_abcdefghijk00000000000000000"}
    # item_price         { 3000 }
    item_id            { 11 }
    user_id            { 1 }

     association :item
  end
end