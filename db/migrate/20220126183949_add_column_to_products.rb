class AddColumnToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :admin, :integer
  end
end
