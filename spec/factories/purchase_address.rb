FactoryBot.define do
  factory :purchase_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '新宿区' }
    house_number { '西新宿2-1' }
    house_name { '東京都本庁舎' }
    phone_number { '01234567890' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end