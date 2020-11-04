class CreateSelectDates < ActiveRecord::Migration[5.2]
  def change
    create_table :select_dates do |t|
      t.date "event_dates"
      t.references :event, foreign_key: true
      t.references :reservation, foreign_key: true
      t.timestamps
    end
  end
end
