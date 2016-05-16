class AddLockedStateToProfileUser < ActiveRecord::Migration
  def change
    add_column :profile_users, :locked_state, :integer
  end
end
