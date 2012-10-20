module Refinery
  module RaceRegistrations
    module Extensions
      module PagesController

        def self.included(base)
          base.class_eval do

            include  Refinery::RaceRegistrations::RegistrationsHelper
            helper :'refinery/race_registrations/registrations'


          end
        end
      end
    end
  end
end
