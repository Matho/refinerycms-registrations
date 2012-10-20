module Refinery
  module RaceRegistrations
    module Admin
      class RegistrationsController < ::Refinery::AdminController

        crudify :'refinery/race_registrations/registration',
                :order => "position DESC",
                :xhr_paging => true

      end
    end
  end
end
