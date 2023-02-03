FactoryBot.define do
  factory :user do
    id {1}
    email {"test@email.com"}
    password {"password"}
    password_confirmation { "password"}
    username {"test_user"}
  end
end