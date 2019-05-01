class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :purchases do |t|
      t.references :user, type: :uuid, foreign_key: true
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
