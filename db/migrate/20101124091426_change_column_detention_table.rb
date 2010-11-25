class ChangeColumnDetentionTable < ActiveRecord::Migration
  def self.up
    change_column :detentions, :billing, :boolean, :default => false
  end

  def self.down
  end
end
