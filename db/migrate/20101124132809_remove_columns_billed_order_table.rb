class RemoveColumnsBilledOrderTable < ActiveRecord::Migration
  def self.up
    remove_column :billed_orders, :detention_billing
    remove_column :billed_orders, :detention_invoice_no
    remove_column :billed_orders, :detention_invoice_amount
    remove_column :billed_orders, :detention_invoice_due_date
    remove_column :billed_orders, :detention_invoice_dispatch_date

    add_column :billed_orders, :paid, :boolean, :default => false
    add_column :billed_orders, :payment_details, :text
  end

  def self.down
  end
end
