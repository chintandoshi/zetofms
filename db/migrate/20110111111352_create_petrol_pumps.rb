class CreatePetrolPumps < ActiveRecord::Migration
  def self.up
    create_table :petrol_pumps do |t|
      t.string :name
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.string :phone1
      t.string :phone2
      t.string :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :petrol_pumps
  end
end
