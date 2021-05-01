FactoryBot.define do
  factory :item do
    name               { Faker::Lorem.words }
    description        { Faker::Lorem.sentence }
    price              { Faker::Number.within(range: 300..9_999_999) }
    category_id           { 2 }
    status_id             { 2 }
    shipping_charge_id    { 2 }
    prefecture_id         { 2 }
    days_to_ship_id       { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
