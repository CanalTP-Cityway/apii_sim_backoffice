# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stop do
    stop_code 1
    mi_system nil
    name "MyString"
    type 1
    administrative_code "MyText"
    site_ref 1
    transport_mode "MyText"
    quay_type "MyText"
    lat "9.99"
    lon "9.99"
    shape ""
  end
end
