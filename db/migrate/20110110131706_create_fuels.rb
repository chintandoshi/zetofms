class CreateFuels < ActiveRecord::Migration
  def self.up
    create_table :fuels do |t|
      t.date    :allocation_date
      t.integer :vehicle_id
      t.integer :branch_id
      t.integer :pump_id
      t.integer :fuel_payment_type_id
      t.integer :fleet_card_id # if payment type is set to fleet card
      t.integer :issued_qty
      t.decimal :issued_rate
      t.decimal :issued_amount

      t.string :invoice_no
      t.string :invoice_date
      t.decimal :invoice_amount
      t.decimal :difference

      t.boolean :paid
      t.text :payment_details
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :fuels
  end
end
