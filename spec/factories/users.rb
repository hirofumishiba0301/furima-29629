FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.last_name }
    last_name_kana { Faker::Name.last_name }
    first_name_kana { Faker::Name.last_name }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 77) }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 8)
    password { password }
    password_confirmation { password }
  end
end
