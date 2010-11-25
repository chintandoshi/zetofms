class CreateBilledOrders < ActiveRecord::Migration
  def self.up
    create_table :billed_orders do |t|
      t.integer :order_id
      t.integer :invoice_no
      t.integer :invoice_amount
      t.date :invoice_due_date
      t.date :invoice_dispatch_date
      t.boolean :detention_billing
      t.integer :detention_invoice_no
      t.integer :detention_invoice_amount
      t.date :dentention_invoice_due_date
      t.date :detention_invoice_dispatch_date
      t.text :notes
      t.string :created_by
      t.string :updated_by
      t.string :approved_by
      t.datetime :approved_at
      t.boolean :approved

      t.timestamps
    end
  end

  def self.down
    drop_table :billed_orders
  end
end
