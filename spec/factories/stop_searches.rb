# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stop_search do
    stop_name "MyString"
    postal_code "MyString"
    administrative_code "MyString"
    stop_code "MyString"
    stop_id 1
    neighbour_stop_id 1
    mis_id 1
    has_transition false
  end
end
