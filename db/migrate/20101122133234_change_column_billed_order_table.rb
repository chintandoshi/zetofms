class ChangeColumnBilledOrderTable < ActiveRecord::Migration
  def self.up
    change_column :billed_orders, :detention_billing, :boolean, :default => false
  end

  def self.down
  end
end
