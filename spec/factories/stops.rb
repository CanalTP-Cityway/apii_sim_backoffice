# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stop do |s|
    code 1
    association :mis
    name "MyString"
    stop_type "GL"
    administrative_code "MyText"
    transport_mode "bus"
    quay_type "MyText"
    lat 1.5656
    lon 48.0909
  end
end
