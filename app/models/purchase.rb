class Purchase < ApplicationRecord
  has_many :meals, through: :purchase_meals
  has_many :purchase_meals
  has_many :purchase_status_histories
  belongs_to :user
end
