class RenameColumnDetentionReason < ActiveRecord::Migration
  def self.up
    rename_column :detention_reasons, :desc, :description
  end

  def self.down
  end
end
