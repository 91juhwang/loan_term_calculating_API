class ChangeTableInformationOnUnits < ActiveRecord::Migration[5.2]
  def change
    rename_table :units, :rent_rolls
    remove_column :rent_rolls, :annual_total
    change_column :rent_rolls, :monthly_rent, :float
  end
end
