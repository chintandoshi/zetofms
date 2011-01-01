class AddTagColumnToRolesTable < ActiveRecord::Migration
  def self.up
    add_column :roles, :tag, :string
  end

  def self.down
  end
end
