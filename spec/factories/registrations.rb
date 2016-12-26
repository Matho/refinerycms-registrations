
FactoryGirl.define do
  factory :registration, :class => Refinery::RaceRegistrations::Registration do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

