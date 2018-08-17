require 'faker'

FactoryBot.define do
  factory :user do
    username { Faker::GameOfThrones.character }
    email { Faker::Internet.email }
    password "jonsnow11"
  end
end
