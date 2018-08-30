class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.integer :monthly_rent
      t.string :unit_number
      t.boolean :vacancy
      t.integer :no_of_bedrooms
      t.integer :no_of_baths
      t.integer :annual_total
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
