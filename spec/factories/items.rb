FactoryBot.define do
  factory :item do
    association :user
    item              { '商品名' }
    explanation       { '商品 説明文' }
    price             { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id       { Faker::Number.between(from: 2, to: 11) }
    status_id         { Faker::Number.between(from: 2, to:  7) }
    delivery_id       { Faker::Number.between(from: 2, to:  3) }
    area_id           { Faker::Number.between(from: 2, to: 48) }
    day_id            { Faker::Number.between(from: 2, to: 4) }
  end
end
