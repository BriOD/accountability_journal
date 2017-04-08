require 'faker'

FactoryGirl.define do
  factory :user do
    name "Brian O'D"
    email "brian@learn.co"
    password "password"
  end
end
