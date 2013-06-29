# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tile do
    title "MyString"
    subtitle "MyString"
    image_id 1
    format "MyString"
    course nil
  end
end
