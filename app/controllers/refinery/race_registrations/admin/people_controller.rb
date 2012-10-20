module Refinery
  module RaceRegistrations
    module Admin
      class PeopleController < ::Refinery::AdminController
        include PeopleHelper
        helper :"refinery/race_registrations/admin/people"

        crudify :'refinery/race_registrations/person',
                :title_attribute => "surname",
                :xhr_paging => false

        before_filter :initialize_update,      :only => :update


        def new
          @person = Person.new
          @categories = Category.all
        end

        def create
          @categories = Category.all

          @person = Person.new(params[:person])
          @person.bypass_humanizer = true


          if @person.save
            flash.notice = t(
                'refinery.crudify.created',
                :what => @person.surname
            )

            find_all_people
            render :index
          else
            render :action => 'new'
          end

        end


        def edit
          # @person comes from crud before_filter
          @categories = Registration.find(@person.registration_id).categories
        end


        protected


        def initialize_update
          # we need to create instance variables for collection_select. Without this method, crudify will call crudify's edit, no edit method in this file
          edit
        end

        # overriding crudify method
        def find_person
          @person = Person.find(params[:id])
          @person.bypass_humanizer = true
        end

        # overriding crudify method
        def find_all_people
          @people = Person.search(params[:search], params[:sort], params[:person]).order(sort_column + " " + sort_direction).paginate(:per_page => 20, :page => params[:page])
        end

        # overriding crudify method
        def search_all_people
          find_all_people
        end


        def render_partial_response?
          # this is initialization only for form - form filtering
          @person = Person.new
          if params[:person]
            @person.registration_ids = params[:person][:registration_ids]
          end

          respond_to do |format|
            format.js { render "index"}
            format.html { render "index"}
          end
        end

      end
    end
  end
end
