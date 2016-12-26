class CreateRaceRegistrationsGroupCategories < ActiveRecord::Migration

  def up
    create_table Refinery::RaceRegistrations::GroupCategory.table_name  do |t|
      t.integer :group_id
      t.integer :category_id
    end

    add_index :refinery_race_registrations_group_categories, :group_id , :name=> "refinery_race_registrations_group_categories_on_group_id"
    add_index :refinery_race_registrations_group_categories, :category_id, :name=> "refinery_race_registrations_group_categories_on_category_id"

  end

  def down
    drop_table :refinery_race_registrations_group_categories
  end

end
