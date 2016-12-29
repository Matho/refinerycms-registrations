FactoryGirl.define do
  factory :registration, :class => Refinery::RaceRegistrations::Registration do
    title "#6 MSDC 2014"
    locality "Ráztoka"
    race_date "2014-10-19"
    is_active true
    start_date "2014-10-11"
    end_date "2014-10-16"
    position 1

    association :group

    factory :registration_with_people do
      transient do
        people_count 5
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |registration, evaluator|
        create_list(:person, evaluator.people_count, registration: registration)
      end

    end

  end
end

