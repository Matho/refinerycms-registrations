class AddRegistrationIdToPeople < ActiveRecord::Migration

  def up
    add_column :refinery_race_registrations_people, :registration_id, :integer
    add_column :refinery_race_registrations_people, :category_id, :integer

    add_index :refinery_race_registrations_people, :registration_id
    add_index :refinery_race_registrations_people, :category_id
  end

  def down
    remove_column :refinery_race_registrations_people, :registration_id
    remove_column :refinery_race_registrations_people, :category_id


    remove_index :refinery_race_registrations_people, :registration_id
    remove_index :refinery_race_registrations_people, :category_id
  end

end