class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.float :loan_amount
      t.float :debt_rate
      t.references :rent_roll, foreign_key: true

      t.timestamps
    end
  end
end
