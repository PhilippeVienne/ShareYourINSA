class Department < ActiveRecord::Base
  belongs_to :insa
  has_many :promotions
end
