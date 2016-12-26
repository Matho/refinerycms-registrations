module Refinery
  module RaceRegistrations
    include ActiveSupport::Configurable

    config_accessor :include_chosen


    self.include_chosen = true
  end
end

