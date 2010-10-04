class CreateVmodels < ActiveRecord::Migration
  def self.up
    create_table :vmodels do |t|
      t.string :model_name
      t.integer :make_id

      t.timestamps
    end
  end

  def self.down
    drop_table :vmodels
  end
end
