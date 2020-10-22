class AddColumnsToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :total_price, :integer
    add_column :reservations, :remarks, :text
    add_column :reservations, :cast_name, :string
  end
end
