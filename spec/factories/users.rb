# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "example#{n}@gmail.com" }
    password "secret"
    password_confirmation "secret"
    auth_token nil

    factory :admin do
      after(:create) { |user| user.add_role :admin }
    end
  end
end
