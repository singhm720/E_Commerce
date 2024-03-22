class AddUserIdToPurchaseRecords < ActiveRecord::Migration[7.1]
  def change
    add_reference :purchase_records, :user, null: false, foreign_key: true
  end
end
