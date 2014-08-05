# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mode do |f|
    f.sequence(:code) { |n| "Mode #{n}" }
    f.sequence(:description) { |n| "Descibing mode #{n}" }
  end
end
