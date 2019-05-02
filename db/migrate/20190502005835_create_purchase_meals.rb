class CreatePurchaseMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_meals do |t|
      t.references :purchase, foreign_key: true, null: false
      t.references :meal, foreign_key: true, null: false
      t.integer :meal_amount, null: false

      t.timestamps
    end
  end
end
