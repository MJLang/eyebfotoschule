# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "example#{n}@gmail.com" }
    password "secret"
    password_confirmation "secret"
    auth_token SecureRandom.urlsafe_base64
  end
end
