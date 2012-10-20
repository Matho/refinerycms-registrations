
FactoryGirl.define do
  factory :category, :class => Refinery::RaceRegistrations::Category do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

