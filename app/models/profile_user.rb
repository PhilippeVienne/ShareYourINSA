class ProfileUser < ActiveRecord::Base
  belongs_to :promotion
  belongs_to :user

  has_attached_file :avatar, styles: {medium: '300x300>', thumb: '100x100>'}, default_url: 'https://static.licdn.com/scds/common/u/images/themes/katy/ghosts/person/ghost_person_60x60_v1.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end
