FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 3)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'太郎'}
    last_name_reading     {'ヤマダ'}
    first_name_reading    {'タロウ'}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end
