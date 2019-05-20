FactoryBot.define do
  factory :user do
    name { Faker::Internet.username(5) }
    email { Faker::Internet.email }
    password { Faker::Internet.password(6) }
  end
end
