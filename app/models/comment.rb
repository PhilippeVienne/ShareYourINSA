class Comment < ActiveRecord::Base

  belongs_to :post
  belongs_to :user

  validates_presence_of :user
  validates_presence_of :post
  validates_length_of :content, minimum: 1, maximum: 255

end
