class AddBeneficiaryToDeliveries < ActiveRecord::Migration[7.0]
  def change
    add_reference :deliveries, :beneficiary, null: false, foreign_key: true
  end
end
