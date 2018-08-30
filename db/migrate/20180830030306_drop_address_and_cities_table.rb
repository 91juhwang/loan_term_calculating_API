class DropAddressAndCitiesTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :address_id
    add_column :properties, :address, :string
    drop_table :addresses
    drop_table :cities
  end
end
