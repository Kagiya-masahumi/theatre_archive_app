FactoryBot.define do
  factory :group do
    name                  {'test'}
    email                 {Faker::Internet.free_email}
    password              {'1a2b3c'}
    password_confirmation {password}
    chair_person {'山田太郎'}
    profile  {'はじめまして、こんにちは'}
    
    after(:build) do |group|
      group.image.attach(io:File.open('public/images/sample.png'),filename: 'sample.png')
    end

    
  end
end