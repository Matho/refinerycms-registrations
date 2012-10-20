module Refinery
  module RaceRegistrations
    class Category < Refinery::Core::BaseModel
      has_many :group_categories
      has_many :groups, :through => :group_categories
      has_many :people , :order => "surname ASC"

      default_scope order("position DESC")

      attr_accessible :title, :position

      acts_as_indexed :fields => [:title]

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
