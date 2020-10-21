class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :event_id
      t.date :date
      t.integer :ticket_type
      t.integer :number_of_ticket

      t.timestamps
    end
  end
end
