FactoryGirl.define do
  factory :person, :class => Refinery::RaceRegistrations::Person do
    name "Petr"
    surname "Malý"
    country "CZE"
    birth_date "1989-05-03"
    club "Club"
    email "jozkohrasko@matho.sk"
    city "Prague"

    association :registration
    association :category

  end
end

