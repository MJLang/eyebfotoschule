# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :training do
    course nil
    booking nil
    timeframe nil
    price nil
  end
end
