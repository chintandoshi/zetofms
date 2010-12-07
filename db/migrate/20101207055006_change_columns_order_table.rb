class ChangeColumnsOrderTable < ActiveRecord::Migration
  def self.up
    change_column :orders, :delorder_number, :string
    change_column :billed_orders, :invoice_no, :string
  end

  def self.down
  end
end
