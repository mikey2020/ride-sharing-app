require 'faker'

FactoryBot.define do
  factory :user do
    username { Faker::GameOfThrones.character }
    email { Faker::Internet.email }
    password "jonsnow11"
  end
end

FactoryBot.define do
  factory :ride do
    origin { Faker::Address.city }
    destination { Faker::Address.city }
    take_off { Faker::Time.between(DateTime.now - 1, DateTime.now) }
    seats_available { Faker::Number.non_zero_digit }
    user_id { Faker::Number.non_zero_digit }
  end
end

FactoryBot.define do
  factory :interest do
    user_id { Faker::Number.non_zero_digit }
    ride_id { Faker::Number.non_zero_digit }
  end
end