class CreateShops < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :shops, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :owner, type: :uuid, foreign_key: true
      t.integer :status, null: false
      t.string :zipcode, null: false
      t.string :address, null: false
      t.string :branch_name, null: false
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end
