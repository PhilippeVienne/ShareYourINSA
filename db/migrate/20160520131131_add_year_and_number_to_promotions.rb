class AddYearAndNumberToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :year, :integer
    add_column :promotions, :number, :integer
    remove_column :promotions, :start_date
    remove_column :promotions, :end_date
  end
end
