class CreatePurchaseStatusHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_status_histories do |t|
      t.references :purchase, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
