class AddCustomercontactColumm < ActiveRecord::Migration
  def self.up
    add_column :custcontacts, :custaccount_id, :integer # Original filename
  end

  def self.down
    remove_column :custcontacts, :custaccount_id
  end
end
