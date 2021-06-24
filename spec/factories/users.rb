FactoryBot.define do
  factory :user do
    id                    {Faker::Number.number(digits:1)}
    email                 {Faker::Internet.free_email}
    password              {'test1234TEST'}
    password_confirmation {password}
    nickname               {'test'}
    name                   {'みる子'}
    family_name            {'芝井'}
    profile                {'はじめまして'}
  end
end
