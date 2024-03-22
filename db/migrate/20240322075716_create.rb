class Create < ActiveRecord::Migration[7.1]
  def change
    remove_column :purchase_records, :product_id
    add_reference :purchase_records, :product, null: false, foreign_key: true
  end  
end
