FactoryGirl.define do
  factory :group, :class => Refinery::RaceRegistrations::Group do
    title "MSDC 2014"

    factory :group_with_category do
      after(:create) do |group|
        create(:category, group: group)
      end
    end
  end
end

