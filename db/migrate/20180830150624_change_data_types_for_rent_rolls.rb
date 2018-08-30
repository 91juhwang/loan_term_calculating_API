class ChangeDataTypesForRentRolls < ActiveRecord::Migration[5.2]
  def change
    change_column :rent_rolls, :vacancy, :integer, using: 'vacancy::integer'
    change_column :rent_rolls, :unit_number, :integer, using: 'unit_number::integer'
    add_column :rent_rolls, :annual_total, :integer
  end
end
