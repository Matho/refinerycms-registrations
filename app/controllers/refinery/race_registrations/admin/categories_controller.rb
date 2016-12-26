module Refinery
  module RaceRegistrations
    module Admin
      class CategoriesController < ::Refinery::AdminController

        crudify :'refinery/race_registrations/category',
                :order => "position DESC",
                :xhr_paging => true

        def index
          if params[:registration_id]
            registration =  Refinery::RaceRegistrations::Registration.find(params[:registration_id])
            @categories = registration.categories

            respond_to do |format|
              format.json { render :json=> @categories  }
            end

          else
            # default crudify action
            search_all_categories if searching?
            paginate_all_categories

            render_partial_response?
          end


        end

        protected

        def category_params
          params.require(:category).permit(:title,:position)
        end

      end
    end
  end
end
