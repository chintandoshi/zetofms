class ChangeColumnTypeOrder < ActiveRecord::Migration
  def self.up
    change_column :orders, :cancelled, :boolean, :default => false
  end

  def self.down
  end
end
