class ShowRoomProfile < ActiveRecord::Base

  belongs_to :profile_user

  validates_presence_of :profile_user
  validates_presence_of :description

end
