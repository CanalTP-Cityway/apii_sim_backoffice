# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stop do |s|
    stop_code 1
    association :mi_system
    name "MyString"
    stop_type 1
    administrative_code "MyText"
    site_ref 1
    transport_mode "MyText"
    quay_type "MyText"
    lat "9.99"
    lon "9.99"
    #shape ""
  end
end
