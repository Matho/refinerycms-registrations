module Refinery
  module RaceRegistrations
    class RegistrationsController < ::ApplicationController
      before_filter :find_all_registrations
      before_filter :find_page


      def redirect
        if params[:registration][:id].present?
          redirect_to refinery.race_registrations_registration_path(params[:registration][:id])
        end
      end

      def index
        @registration = Registration.first
        redirect_to refinery.race_registrations_registration_path(:id=> @registration)
      end

      def show
        @registration = Registration.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @registration in the line below:
        present(@page)
      end

      protected

      def find_all_registrations
        @registrations = Registration.order('position ASC')
      end

      def find_page
        @page = Refinery::Page.where(:link_url => "/race_registrations/registrations").first
      end


    end
  end
end
