class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :position
      t.string :department
      t.string :phone1
      t.string :phone2
      t.string :email
      t.string :fax
      t.integer :resource_id
      t.string :resource_type


      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
