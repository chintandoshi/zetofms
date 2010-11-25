class AddColumnsOrderTable < ActiveRecord::Migration
  def self.up
    add_column :orders, :created_by, :string
    add_column :orders, :updated_by, :string
    add_column :orders, :approved, :boolean, :default => false
    add_column :orders, :approved_by, :string
  end

  def self.down
  end
end
