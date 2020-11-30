FactoryBot.define do
  factory :order_ship do
    postal_code{'123-4567'}
    address{'青葉1-1-1'}
    city{'港区'}
    prefecture_id{2}
    phone_number{'09077777777'}
  end
end