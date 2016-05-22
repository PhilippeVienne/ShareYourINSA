class CreateShowRoomProfiles < ActiveRecord::Migration
  def change
    create_table :show_room_profiles do |t|
      t.integer :profile_user_id
      t.integer :active
      t.integer :position
      t.text :description
      t.string :video_resource

      t.timestamps null: false
    end
  end
end
