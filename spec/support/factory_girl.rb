require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end
  factory :photo do
    name "penguin"
    description "penguin"
    tag "animal"
    likes 1
  end
end
