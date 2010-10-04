class ChangePhonenumbercolumnTypes < ActiveRecord::Migration
  def self.up
        change_column :drivers, :phone_country_1, :string
        change_column :drivers, :phone_area_1, :string
        change_column :drivers, :phone_number_1, :string
        change_column :drivers, :phone_ext_1, :string
        change_column :drivers, :phone_country_2, :string
        change_column :drivers, :phone_area_2, :string
        change_column :drivers, :phone_number_2, :string
        change_column :drivers, :phone_ext_2, :string
  end

  def self.down
        raise ActiveRecord::IrreversibleMigration
  end
end
