class Customer < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :user

  has_many :orders
end
