class Promotion < ActiveRecord::Base
  belongs_to :department
  has_many :profile_users

  def full_name
    "#{department.insa.name} - #{department.department_name} - #{year}"
  end

  def to_s
    full_name
  end


end
