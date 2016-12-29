module Refinery
  module RaceRegistrations
    module Admin
      class GroupsController < ::Refinery::AdminController

        crudify :'refinery/race_registrations/group',
                :order => "position DESC",
                :xhr_paging => true


        protected

        def group_params
          params.require(:group).permit(:title, :position, :category_ids => [])
        end

      end
    end
  end
end
