class RemoveRentRollIdColumnInQuotes < ActiveRecord::Migration[5.2]
  def change
    remove_column :quotes, :rent_roll_id
  end
end
