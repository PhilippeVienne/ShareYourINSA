class CreateProfileUsers < ActiveRecord::Migration
  def change
    create_table :profile_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :industry_domain
      t.string :location
      t.string :phone_number
      t.text :languages_spoken
      t.text :skills
      t.text :diplomas
      t.integer :promotion_id

      t.timestamps null: false
    end
  end
end
