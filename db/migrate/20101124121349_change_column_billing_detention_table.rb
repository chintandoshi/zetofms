class ChangeColumnBillingDetentionTable < ActiveRecord::Migration
  def self.up
     change_column :detentions, :paid, :boolean, :default => false
  end

  def self.down
  end
end
