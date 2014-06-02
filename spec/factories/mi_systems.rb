# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mi_system do |f|
    f.sequence(:name) { |n| "MIS #{n}" }
    f.sequence(:comment) { |n| "Comment to MIS #{n}" }
    f.sequence(:api_url) { |n| "http://api#{n}.org" }
    f.sequence(:api_key) { |n| "key #{n}" }
    f.start_date "2014-04-22 13:39:56"
    f.end_date "2015-04-22 13:39:56"
    f.multiple_starts_and_arrivals 1

    after(:create) do |mis|
      0.upto(15) do |i|
        create(:stop, :mi_system => mis, :stop_code => "code #{mis.name}-#{i}")
      end
    end
  end
end
