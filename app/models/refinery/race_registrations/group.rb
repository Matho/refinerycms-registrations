module Refinery
  module RaceRegistrations
    class Group < Refinery::Core::BaseModel
      has_many :group_categories, :dependent => :destroy
      has_many :categories, :through => :group_categories
      has_many  :registration


      validates :title, :presence => true, :uniqueness => true


      def category_ids
        Refinery::RaceRegistrations::GroupCategory.select('category_id').where("group_id = ?", self.id ).map{|gc| gc.category_id }
      end
    end
  end
end
