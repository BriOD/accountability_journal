require 'faker'


FactoryGirl.define do
  factory :journal do
    name "MyString"
    user
  end
end
