class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.float :marketing
      t.float :taxes
      t.float :insurance
      t.float :repairs
      t.float :administration
      t.float :payroll
      t.float :utility
      t.float :management
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
