class AddUserToProfileUsers < ActiveRecord::Migration
  def change
    add_column :profile_users, :user_id, :integer
  end
end
