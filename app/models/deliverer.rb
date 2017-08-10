class Deliverer < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :orders
  has_many :customers, through: :orders
end
