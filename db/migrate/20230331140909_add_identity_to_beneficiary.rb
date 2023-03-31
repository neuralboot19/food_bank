class AddIdentityToBeneficiary < ActiveRecord::Migration[7.0]
  def change
    add_column :beneficiaries, :identity, :string, null: false, unique: true
  end
end
