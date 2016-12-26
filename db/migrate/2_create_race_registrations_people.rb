class CreateRaceRegistrationsPeople < ActiveRecord::Migration

  def up
    create_table Refinery::RaceRegistrations::Person.table_name  do |t|
      t.string :name
      t.string :surname
      t.string :country
      t.date :birth_date
      t.string :email
      t.string :club
      t.string :city
      t.text :notice
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-race_registrations"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/race_registrations/people"})
    end

    drop_table :refinery_race_registrations_people

  end

end
