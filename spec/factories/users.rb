FactoryBot.define do
  factory :user do
    nickname               {"furima"} 
    email                  {Faker::Internet.free_email}
    password               {Faker::Internet.password(min_length: 6)}
    password_confirmation  {password}
    first_name             {"山田"}
    last_name              {"太郎"}
    first_name_reading     {"ヤマダ"}
    last_name_reading      {"タロウ"} 
    # birthday               {"1930-1-1"} 
    birthday               {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}

  end
end
