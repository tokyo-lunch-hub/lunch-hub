class AddColumnToShop < ActiveRecord::Migration[5.2]
  def change
    add_reference :shops, :prefecture, foreign_key: true
  end
end
