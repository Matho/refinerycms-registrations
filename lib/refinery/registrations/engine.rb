module Refinery
  module RaceRegistrations
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::RaceRegistrations

      engine_name :refinery_registrations

      initializer "register refinerycms_registrations plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "refinerycms-registrations"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.race_registrations_admin_registrations_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/race_registrations/registration'
          }
          plugin.menu_match = %r{refinery/race_registrations(/.+)?$}
        end
      end

      config.to_prepare do
        require 'refinerycms-pages'
        require 'humanizer'
        require 'csv'
        Refinery::PagesController.send :include, Refinery::RaceRegistrations::Extensions::PagesController
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Registrations)
      end
    end
  end
end
