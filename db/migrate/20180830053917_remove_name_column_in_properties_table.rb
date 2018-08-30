class RemoveNameColumnInPropertiesTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :property_name
  end
end
