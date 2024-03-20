class CreatePurchaseRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :purchase_records do |t|
      t.string :user_email
      t.string :user_name
      t.integer :product_id
      t.string :product_name
      t.decimal :product_price
      t.decimal :total_cart_price
      t.string :transaction_id

      t.timestamps
    end
  end
end
