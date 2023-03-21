class Delivery < ApplicationRecord
  validates :quantity, presence: true
end
