class CreateFuelPaymentTypes < ActiveRecord::Migration
  def self.up
    create_table :fuel_payment_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :fuel_payment_types
  end
end
