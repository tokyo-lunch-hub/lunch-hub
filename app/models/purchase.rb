class Purchase < ApplicationRecord
  has_many :meals, through: :purchase_meals
  has_many :purchase_meals
  belongs_to :user
end
