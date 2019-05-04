class Shop < ApplicationRecord
  belongs_to :owner
  belongs_to :prefecture
end
