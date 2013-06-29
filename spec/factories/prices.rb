# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :price do
    amount "9.99"
    description "MyString"
    course nil
  end
end
