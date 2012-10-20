require 'refinerycms-core'

module Refinery
  autoload :RegistrationsGenerator, 'generators/refinery/registrations_generator'

  module Registrations
    require 'refinery/registrations/engine'
    require 'refinery/registrations/extensions/pages_controller_extension'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
