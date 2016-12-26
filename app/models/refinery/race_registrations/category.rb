module Refinery
  module RaceRegistrations
    class Category < Refinery::Core::BaseModel
      has_many :group_categories
      has_many :groups, :through => :group_categories
      has_many :people

      default_scope { order("position DESC") }

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
