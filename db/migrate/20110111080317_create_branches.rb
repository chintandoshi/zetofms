class CreateBranches < ActiveRecord::Migration
  def self.up
    create_table :branches do |t|
      t.string :name
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.string :phone1
      t.string :phone2
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :branches
  end
end
