# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :content do
    url "MyText"
    content_type "MyString"
    status "MyString"
  end
end