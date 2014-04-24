# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mi_system do |f|
    f.sequence(:name) { |n| "Name #{n}" }
    f.sequence(:comment) { |n| "Comment #{n}" }
    f.sequence(:api_url) { |n| "http://api#{n}.org" }
    f.sequence(:api_key) { |n| "key #{n}" }
    f.start_date "2014-04-22 13:39:56"
    f.end_date "2014-04-22 13:39:56"
    f.multiple_starts_and_arrivals 1
  end
end
