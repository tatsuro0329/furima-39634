FactoryBot.define do
  factory :buy do
    post_code       { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    municipalities  { Faker::Address.city } 
    house_number    { Faker::Address.street_address } 
    tel             { Faker::Number.number(digits: 10) } 
    sender_id       { Faker::Number.between(from: 2, to: 48) }
    token           { "tok_#{Faker::Alphanumeric.alphanumeric(number: 24)}" }

    trait :invalid_post_code do
      post_code     { '1234567' }
    end

    trait :invalid_tel do
      tel           { '01234abcd5' }
    end
  end
end
