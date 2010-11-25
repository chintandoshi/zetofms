class CreateDetentionReasons < ActiveRecord::Migration
  def self.up
    create_table :detention_reasons do |t|
      t.string :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :detention_reasons
  end
end
