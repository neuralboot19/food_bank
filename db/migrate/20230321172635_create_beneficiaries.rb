class CreateBeneficiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :beneficiaries do |t|
      t.string :names, null: false
      t.string :email, null: false
      t.string :first_surname, null: false
      t.string :second_surname, null: false
      t.integer :cel_phone, null: false, default: 0
      t.datetime :born, null: false
      t.string :other_address, null: false
      t.datetime :expiration_date_document, null: false
      t.boolean :status_document, default: false
      t.integer :family_unit, null: false, default: 1
      t.boolean :terms_conditions, default: false

      t.timestamps
    end
  end
end
