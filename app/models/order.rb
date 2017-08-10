class Order < ApplicationRecord
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :customer
  belongs_to :deliverer
end
