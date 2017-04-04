require 'faker'

FactoryGirl.define do
  factory :user do
    name { Faker::Name }
    email { Faker::Internet.Email }
    password_digest "password"
  end
end
