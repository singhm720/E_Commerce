class AddOrderIdToPurchaseRecords < ActiveRecord::Migration[7.1]
  def change
    add_column :purchase_records, :order_id, :string
  end
end
