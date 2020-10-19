class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string "event_name", null: false
      t.date "period"
      t.integer "tikcket_type"
      t.integer "number_of_tiket"
      t.integer "total_price"
      t.string "cast_name"
      t.integer "status"
      t.text "remarks"
      t.timestamps
    end
  end
end
