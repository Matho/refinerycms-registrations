module Refinery
  module RaceRegistrations
    class GroupCategory < Refinery::Core::BaseModel
       belongs_to :group
       belongs_to :category
    end
  end
end
