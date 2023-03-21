class AddNullFalseToDeliveryFields < ActiveRecord::Migration[7.0]
  def change
    change_column_null :deliveries, :quantity, false
    change_column_null :deliveries, :observation, false
  end
end
