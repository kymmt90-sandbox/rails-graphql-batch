class Customer < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :user

  has_many :orders
  has_many :deliverer, through: :orders
end
