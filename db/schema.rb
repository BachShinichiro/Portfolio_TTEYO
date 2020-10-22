
ActiveRecord::Schema.define(version: 2020_10_21_084929) do

  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "event_name", null: false
    t.date "period"
    t.integer "tikcket_type"
    t.integer "number_of_tiket"
    t.integer "total_price"
    t.string "cast_name"
    t.integer "status"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.text "flyer"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.date "date"
    t.integer "ticket_type"
    t.integer "number_of_ticket"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_price"
    t.text "remarks"
    t.string "cast_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "users"
end
