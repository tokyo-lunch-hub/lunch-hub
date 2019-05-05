class CreatePurchaseStatusHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_status_histories do |t|
      t.references :purchase, foreign_key: true, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
