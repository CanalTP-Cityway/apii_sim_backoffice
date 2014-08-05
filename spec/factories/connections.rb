# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :connection do |f|
    f.association :stop1, factory: :stop
    f.association :stop2, factory: :stop
    f.distance 1
    f.duration 1
    f.prm_duration 1
  end
end
