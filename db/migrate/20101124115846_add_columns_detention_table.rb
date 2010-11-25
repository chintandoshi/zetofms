class AddColumnsDetentionTable < ActiveRecord::Migration
  def self.up
    add_column :detentions, :invoice_no, :string
    add_column :detentions, :invoice_amount, :integer
    add_column :detentions, :invoice_due_date, :date
    add_column :detentions, :invoice_dispatch_date, :date
    add_column :detentions, :paid, :boolean
    add_column :detentions, :payment_details, :text
  end

  def self.down
  end
end
