class CreateConsignors < ActiveRecord::Migration
  def self.up
    create_table :consignors do |t|
      t.string :consignor_name
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.string :postal_code
      t.string :phone1
      t.string :phone2
      t.string :email
      t.string :fax
      t.string :website

      t.timestamps
    end
  end

  def self.down
    drop_table :consignors
  end
end
