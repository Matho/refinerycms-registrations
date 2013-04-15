module Refinery
  module RaceRegistrations
    class Person < Refinery::Core::BaseModel
      include Humanizer
      require_human_on :create , :unless => :bypass_humanizer

      belongs_to :registration
      belongs_to :category


      attr_accessible :name, :surname, :country, :birth_date, :email, :club, :city, :notice, :position, :registration_id, :category_id, :humanizer_answer, :humanizer_question_id
      attr_accessor   :registration_ids, :bypass_humanizer

      validates :name,            :presence => true , :length => { :minimum => 2 }
      validates :surname,         :presence => true,  :length => { :minimum => 2 }
      validates :city,            :presence => true,  :length => {:minimum  => 2}
      validates :country,         :presence => true,  :length => {:minimum  => 2, :maximum=> 20}
      validates :birth_date,      :presence => true
      validates :registration_id, :numericality => true
      validates :category_id,     :numericality => true
      validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i , :allow_blank => false


      scope :search_by_sort,             lambda {|search, sort|
        if ActiveRecord::Base.configurations[Rails.env]['adapter'] == "postgresql" &&  (sort == "id" or sort == "birth_date")
          where("#{sort}::TEXT  ILIKE ?", "#{search}%") # sort is whitelisted in people helper
        else
          where( arel_table[sort].matches("#{search}%") )
        end
      }

      scope :search_by_registration_ids, lambda {|registration_ids| where( :registration_id => registration_ids ) if registration_ids.present? }
      scope :search_by_sort_and_registration_ids, lambda {|search, sort, registration_ids| search_by_sort(search,sort).search_by_registration_ids(registration_ids) }

      scope :in_category, lambda {|category_id, sort_column, sort_direction| where("category_id = ?", category_id).order(sort_column + " " + sort_direction)  }

      def self.search(search, sort, person)
        registration_ids = nil

        if person.present? && person[:registration_ids].present?
          registration_ids =  person[:registration_ids].select{|reg_id| reg_id.to_i > 0  }
        end

        if search
          if sort != ""
            search_by_sort_and_registration_ids(search,sort,registration_ids)
          else
            search_by_sort_and_registration_ids(search,"surname",registration_ids)
          end
        else
          search_by_registration_ids(registration_ids)
        end
      end

    end
  end
end
