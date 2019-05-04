class PurchaseMeal < ApplicationRecord
  belongs_to :purchase
  belongs_to :meal
end
