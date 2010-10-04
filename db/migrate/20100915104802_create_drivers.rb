class CreateDrivers < ActiveRecord::Migration
  def self.up
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :addr_line_1
      t.string :addr_line_2
      t.string :addr_line_3
      t.string :city
      t.string :state
      t.string :country
      t.string :postal_code
      t.string :addr_line_1_perm
      t.string :addr_line_2_perm
      t.string :addr_line_3_perm
      t.string :city_perm
      t.string :state_perm
      t.string :country_perm
      t.string :postal_code_perm
      t.integer :phone_country_1
      t.integer :phone_area_1
      t.integer :phone_number_1
      t.integer :phone_ext_1
      t.integer :phone_country_2
      t.integer :phone_area_2
      t.integer :phone_number_2
      t.integer :phone_ext_2
      t.string :driving_license_number
      t.date :driving_license_validity
      t.string :blood_group
      t.date :date_of_birth
      t.timestamps
    end
  end

  def self.down
    drop_table :drivers
  end
end
