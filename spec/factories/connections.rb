# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :connection do |f|
    f.association :stop_1, factory: :stop
    f.association :stop_2, factory: :stop
    f.distance 1
    f.duration 1
    f.prm_duration 1
  end
end
