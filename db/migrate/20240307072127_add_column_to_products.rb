class AddColumnToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :title_name, :text
    add_column :products, :title_description, :text
    add_column :products, :title_price, :decimal
  end
end
