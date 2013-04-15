module Refinery
  module RaceRegistrations
    module Admin
      module PeopleHelper
        def sortable(column, title = nil)
          title ||= column.titleize
          css_class = column == sort_column ? "current_th #{sort_direction}" : nil
          direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"

          options = {:sort => column, :direction => direction, :page => nil, :person => params[:person]}

          link_to title, refinery.race_registrations_admin_people_path(options), {:class => css_class} 
       end

        def sort_column
          %w[name surname country birth_date email club city registration_id category_id created_at].include?(params[:sort]) ? params[:sort] : "id"
        end

        def sort_direction
          %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
        end
      end
    end
  end
end
