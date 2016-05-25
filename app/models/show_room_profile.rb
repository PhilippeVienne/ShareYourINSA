class ShowRoomProfile < ActiveRecord::Base

  belongs_to :profile_user

  validates_presence_of :profile_user

  def user=(null)

  end

  rails_admin do
    edit do
      field :active
      field :profile_user
      field :video_resource
      field :description
      field :position
    end
  end

end
