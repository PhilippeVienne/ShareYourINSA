class Promotion < ActiveRecord::Base
  belongs_to :department
  has_many :profile_users

  def promotions_name
    @promotions_name = []
    self.all.collect { |p| [@promotions_name << "#{p.start_date}-#{p.end_date} #{Department.find(p.id).department_name}"] }
    @promotions_name
  end
end
