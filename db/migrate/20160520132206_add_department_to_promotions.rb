class AddDepartmentToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :department_id, :integer
  end
end
