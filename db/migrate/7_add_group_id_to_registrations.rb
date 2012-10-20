class AddGroupIdToRegistrations < ActiveRecord::Migration

  def up
    add_column :refinery_race_registrations_registrations, :group_id, :integer
    add_index  :refinery_race_registrations_registrations, :group_id
  end

  def down
    remove_column :refinery_race_registrations_registrations, :group_id
    remove_index  :refinery_race_registrations_registrations, :group_id
  end

end