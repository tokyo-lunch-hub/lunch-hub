class Meal < ApplicationRecord
  has_many :purchases, through: :purchase_meals
  has_many :purchase_meals
  belongs_to :shops
end
