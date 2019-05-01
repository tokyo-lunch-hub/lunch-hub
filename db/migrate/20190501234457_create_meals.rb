class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :meals do |t|
      t.references :shops, type: :uuid, foreign_key: true
      t.string :name, null: false
      t.text :description, null: false
      t.decimal :price, null: false

      t.timestamps
    end
  end
end
