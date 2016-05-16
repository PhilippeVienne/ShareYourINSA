class ProfileUser < ActiveRecord::Base
  belongs_to :promotion
  belongs_to :user
end
