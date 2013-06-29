# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :timeframe do
    starts_at "2013-06-28 19:42:34"
    ends_at "2013-06-28 19:42:34"
    days 1
    description "MyString"
    course nil
  end
end
