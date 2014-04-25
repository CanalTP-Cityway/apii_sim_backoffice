# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :connection do
    stop_1_id nil
    stop_2_id nil
    distance 1
    duration 1
    prm_duration 1
  end
end
