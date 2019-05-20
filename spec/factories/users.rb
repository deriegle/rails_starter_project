FactoryBot.define do
  factory :user do
    name { Faker::Internet.username(5) }
    email { Faker::Internet.email }
    password_digest { Faker::Internet.password(6) }
  end
end
