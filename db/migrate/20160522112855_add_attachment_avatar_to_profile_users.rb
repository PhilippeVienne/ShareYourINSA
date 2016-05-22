class AddAttachmentAvatarToProfileUsers < ActiveRecord::Migration
  def self.up
    change_table :profile_users do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :profile_users, :avatar
  end
end
