FactoryBot.define do
  # include ActionDispatch::TestProcess
  factory :item do

    title              { Faker::Lorem.sentence }
    text               { Faker::Lorem.paragraph }
    category_id        { Category.where.not(id: 1).pluck(:id).sample }
    condition_id       { Condition.where.not(id: 1).pluck(:id).sample }
    delivery_charge_id { DeliveryCharge.where.not(id: 1).pluck(:id).sample }
    sender_id          { Sender.where.not(id: 1).pluck(:id).sample }
    days_to_ship_id    { DaysToShip.where.not(id: 1).pluck(:id).sample }

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    price           { Faker::Number.within(range: 300..9999999) }
    trait :invalid_price_with_word do
    price           { Faker::Lorem.word }
    end
    trait :invalid_price_with_fullwidth_number do
    price           { Faker::Number.within(range: 300..9999999).to_s.tr('0-9', '０-９') }
    end
  
    association :user
  end
end