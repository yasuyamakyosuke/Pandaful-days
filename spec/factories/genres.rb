FactoryBot.define do
  factory :genre do
    genre_name { Faker::Lorem.characters(number:5) }
    # genre
    # station
    # shop_comment
    # shop_iamge
    # favorite
  end
end