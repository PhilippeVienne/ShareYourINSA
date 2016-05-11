class Insa < ActiveRecord::Base
  has_many :departments
  has_many :promotions, through: :departments
end
