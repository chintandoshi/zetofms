class CreateDetentions < ActiveRecord::Migration
  def self.up
    create_table :detentions do |t|
      t.integer :order_id
      t.integer :detention_location_id
      t.datetime :start_time
      t.datetime :end_time
      t.integer :detention_reason_id
      t.text :notes
      t.boolean :billing
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :detentions
  end
end
