# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hotel do
    name "MyString"
    address "MyString"
    star_rating 1
    accomodation_type "MyString"
  end
end
