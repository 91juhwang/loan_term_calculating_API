class AddCreatedByColumnToQuotesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :created_by, :string
  end
end
