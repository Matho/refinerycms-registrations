
FactoryGirl.define do
  factory :person, :class => Refinery::RaceRegistrations::Person do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

