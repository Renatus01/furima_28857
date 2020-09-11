FactoryBot.define do
  factory :order_address do
    token          { 'token' }
    postal_code    { '123-4567' }
    prefecture_id  { 2 }
    city           { '文京区' }
    house_number   { '1-1' }
    building_name  { '東京ハイツ' }
    phone_number   { '123456789 ' }
  end
end
