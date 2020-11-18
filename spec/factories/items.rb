FactoryBot.define do
  factory :item do
    name { Faker::Name.last_name }
    info { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    sale_id { Faker::Number.between(from: 2, to: 7) }
    prefecture_id { Faker::Number.between(from: 2, to: 47) }
    scheduled_id { Faker::Number.between(from: 2, to: 4) }
    shipping_id { Faker::Number.between(from: 2, to: 3) }
    price { Faker::Number.between(from: 300, to: 9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
