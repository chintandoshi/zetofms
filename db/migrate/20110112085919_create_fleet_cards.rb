class CreateFleetCards < ActiveRecord::Migration
  def self.up
    create_table :fleet_cards do |t|
      t.string :name
      t.text :details

      t.timestamps
    end
  end

  def self.down
    drop_table :fleet_cards
  end
end
