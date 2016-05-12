class Promotion < ActiveRecord::Base
  belongs_to :department
  has_many :profile_users
end
