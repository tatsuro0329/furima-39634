FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    last_name
    first_name
    last_name_kana
    first_name_kana
    birth_day
  end
end