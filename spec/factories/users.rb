FactoryBot.define do
  factory :user do
    name { Faker::FunnyName.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    api_key { Faker::Alphanumeric.alphanumeric(number: 32) }
  end
end
