module Refinery
  module RaceRegistrations
    class CategoriesController < ::ApplicationController

      def index
        if params[:registration_id]
          registration =  Refinery::RaceRegistrations::Registration.find(params[:registration_id])
          @categories = registration.categories

          respond_to do |format|
            format.json { render :json=> @categories  }
          end
        end
      end
    end
  end
end
