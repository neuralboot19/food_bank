class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.string :quantity, null: false, default: "0.0"
      t.string :observation

      t.timestamps
    end
  end
end
