module Refinery
  module RaceRegistrations
    class PeopleController < ::ApplicationController
      before_filter :find_page

      def new
        @person = Person.new
        @registrations = Registration.published
        @categories = @registrations.first.try(:categories)

        present(@page)
      end

      def create
        @person =   Person.new(params[:person])

        if @person.save
          redirect_to refinery.race_registrations_registration_path(:id=> @person.registration_id) , :notice => t('refinery.crudify.created', :what => @person.name + " " + @person.surname )
        else
          @registrations = Registration.published
          @categories = @registrations.first.try(:categories)

          render :action=> "new"
        end
      end


      protected

      def find_page
        @page = Refinery::Page.where(:link_url => "/race_registrations/people/new").first
      end

    end
  end
end
