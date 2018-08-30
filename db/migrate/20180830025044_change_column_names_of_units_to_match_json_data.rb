class ChangeColumnNamesOfUnitsToMatchJsonData < ActiveRecord::Migration[5.2]
  def change
    rename_column :units, :no_of_bedrooms, :bedrooms
    rename_column :units, :no_of_baths, :bathrooms
  end
end
