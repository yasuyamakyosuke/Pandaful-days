FactoryBot.define do
  factory :shop_comment do
    shop_comment { Faker::Lorem.characters(number:50) }
  end
end