class CreateConsignees < ActiveRecord::Migration
  def self.up
    create_table :consignees do |t|
      t.string :consignee_name
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
    drop_table :consignees
  end
end
