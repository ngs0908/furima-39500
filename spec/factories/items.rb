FactoryBot.define do
  factory :item do
    item_name { 'テスト商品' }
    description { 'Sample description' }
    category_id { 1 }
    condition_id { 1 }
    delivery_charge_id { 1 }
    prefecture_id { 1 }
    ship_date_id { 1 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
