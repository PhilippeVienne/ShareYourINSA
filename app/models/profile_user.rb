class ProfileUser < ActiveRecord::Base
  belongs_to :promotion
  belongs_to :user

  has_attached_file :avatar, styles: {medium: '300x300>', thumb: '100x100>'}, default_url: :default_avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def name
    "#{first_name} #{last_name}"
  end

  private
  def default_avatar
    "https://api.adorable.io/avatars/300/#{id}-#{first_name}.png"
  end
end
