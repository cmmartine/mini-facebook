FactoryBot.define do
  factory :user do
    id { 1 }
    email { "test@email.com" }
    password { "password" }
    password_confirmation { "password" }
    username { "test_user" }
    confirmed_at { '1999-12-29 13:01:23 UTC' }
    confirmation_sent_at { '1999-12-29 13:01:24 UTC' }
  end
end
