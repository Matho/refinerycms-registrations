class CreateRaceRegistrationsRegistrations < ActiveRecord::Migration

  def up
    create_table :refinery_race_registrations_registrations do |t|
      t.string :title
      t.string :locality
      t.date :race_date
      t.boolean :is_active
      t.datetime :start_date
      t.datetime :end_date
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-race_registrations"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/race_registrations/registrations"})
    end

    drop_table :refinery_race_registrations_registrations

  end

end
