class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :owners, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :name, null: false
      t.string :phone_number, null: false
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
