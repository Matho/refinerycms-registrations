module Refinery
  module RaceRegistrations
    class Registration < Refinery::Core::BaseModel
      has_many   :people, :dependent => :destroy
      belongs_to :group
      has_many :categories , :through => :group  , :order=> "position DESC"


      default_scope order("position DESC")

      attr_accessible :title, :locality, :race_date, :is_active, :start_date, :end_date, :position, :group_id

      acts_as_indexed :fields => [:title, :locality]

      def self.to_csv(options = {})
        CSV.generate(options) do |csv|
          csv << column_names
          all.each do |product|
            csv << product.attributes.values_at(*column_names)
          end
        end
      end


      validates :title, :presence => true, :uniqueness => true
      validates :group_id, :presence => true

      scope :not_expired, lambda {
        registrations = Arel::Table.new(::Refinery::RaceRegistrations::Registration.table_name)
        where(registrations[:end_date].eq(nil).or(registrations[:end_date].gt(Time.now)))
      }
      scope :active, where(:is_active => true)
      scope :published, lambda {
        not_expired.active.where("start_date <= ?", Time.now).order(:position)
      }


      def to_param
        "#{id}-#{title.parameterize}"
      end

    end
  end
end

