class CreateRaceRegistrationsCategories < ActiveRecord::Migration

  def up
    create_table :refinery_race_registrations_categories do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-race_registrations"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/race_registrations/categories"})
    end

    drop_table :refinery_race_registrations_categories

  end

end
