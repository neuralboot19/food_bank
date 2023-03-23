class Delivery < ApplicationRecord
  validates :quantity, length: { minimum: 1, maximum: 4 }, numericality: true, presence: true
  validate :greater_than

  belongs_to :beneficiary

  private
    def greater_than
      errors.add(:quantity) if quantity == "0.0" || quantity == "0"
    end
end
