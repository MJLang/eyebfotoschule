# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "MyString"
    markdown_body "MyText"
    body "MyText"
    authored_by "MyString"
  end
end
