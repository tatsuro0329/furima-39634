FactoryBot.define do
  factory :user do
    japanese_user = Gimei.name

    nickname              { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { japanese_user.first.kanji }
    first_name_kana       { japanese_user.first.katakana }
    last_name             { japanese_user.last.kanji }
    last_name_kana        { japanese_user.last.katakana }
    birth_day             { Faker::Date.birthday(min_age: 5, max_age: 93) }
  end
end