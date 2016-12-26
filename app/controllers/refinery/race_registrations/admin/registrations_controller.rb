module Refinery
  module RaceRegistrations
    module Admin
      class RegistrationsController < ::Refinery::AdminController

        crudify :'refinery/race_registrations/registration',
                :order => "position DESC",
                :xhr_paging => true

        protected

        def registration_params
          params.require(:registration).permit(:title, :locality, :race_date, :is_active, :start_date, :end_date, :position, :group_id)
        end

      end
    end
  end
end
