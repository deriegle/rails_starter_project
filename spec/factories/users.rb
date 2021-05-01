FactoryBot.define do
  factory :user do
    name { Faker::Internet.username(specifier: 5) }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
  end
end
