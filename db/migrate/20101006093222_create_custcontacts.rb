class CreateCustcontacts < ActiveRecord::Migration
  def self.up
    create_table :custcontacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :position
      t.string :department
      t.string :phone1
      t.string :phone2
      t.string :email
      t.string :fax

      t.timestamps
    end
  end

  def self.down
    drop_table :custcontacts
  end
end
