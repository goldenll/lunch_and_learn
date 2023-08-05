FactoryBot.define do
  factory :recipe do
    title { Faker::Food.dish }
    url { Faker::Internet.url }
    country { Faker::Address.country }
    image { Faker::Internet.url }
  end
end
