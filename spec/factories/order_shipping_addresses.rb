FactoryBot.define do
  factory :order_shipping_address do
    postal_code   { '123-4567' }
    prefecture_id { 2 }
    city          { Faker::Lorem.sentence }
    house_number  { Faker::Lorem.sentence }
    building_name { Faker::Lorem.sentence }
    phone_number  { Faker::Number.number(digits: 11) }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
