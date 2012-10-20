module Refinery
  module RaceRegistrations
    module Admin
      class GroupsController < ::Refinery::AdminController

        crudify :'refinery/race_registrations/group',
                :order => "position DESC",
                :xhr_paging => true

      end
    end
  end
end
