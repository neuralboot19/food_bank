class Delivery < ApplicationRecord
  validates :quantity, presence: true
  validates :observation, presence: true
end
