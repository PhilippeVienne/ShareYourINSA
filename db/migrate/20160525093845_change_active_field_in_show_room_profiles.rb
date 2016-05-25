class ChangeActiveFieldInShowRoomProfiles < ActiveRecord::Migration
  def change
    remove_column :show_room_profiles, :active
    add_column :show_room_profiles, :active, :boolean
  end
end
