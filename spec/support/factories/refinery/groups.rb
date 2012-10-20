
FactoryGirl.define do
  factory :group, :class => Refinery::RaceRegistrations::Group do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

