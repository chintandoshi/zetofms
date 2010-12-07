class CreateOrderStatusTypes < ActiveRecord::Migration
  def self.up
    create_table :order_status_types do |t|
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :order_status_types
  end
end
