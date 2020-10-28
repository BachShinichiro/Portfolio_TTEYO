class RemoveTicketTypeFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :tikcket_type, :integer
    remove_column :events, :number_of_tiket, :integer
    remove_column :events, :total_price, :integer
    remove_column :events, :cast_name, :string
  end
end
