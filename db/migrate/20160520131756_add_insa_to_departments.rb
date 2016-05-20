class AddInsaToDepartments < ActiveRecord::Migration
  def change
    add_column :departments, :insa_id, :integer
  end
end
