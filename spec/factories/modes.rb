# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mode do |f|
    f.sequence(:mode_code) { |n| "Mode #{n}" }
    f.sequence(:mode_description) { |n| "Descibing mode #{n}" }
  end
end
