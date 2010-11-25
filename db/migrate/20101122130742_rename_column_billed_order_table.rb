class RenameColumnBilledOrderTable < ActiveRecord::Migration
  def self.up
        rename_column :billed_orders, :dentention_invoice_due_date, :detention_invoice_due_date
  end

  def self.down
  end
end
