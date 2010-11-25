class AddColumnOrderTable < ActiveRecord::Migration
  def self.up
    add_column :orders, :approved_at, :string
  end

  def self.down
  end
end
