# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2020_07_14_031450) do
=======
ActiveRecord::Schema.define(version: 2020_07_19_043520) do
>>>>>>> cf66098562db38baa90e411c13a42298b12adde5

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "country"
  end

  create_table "restaurants", force: :cascade do |t|
    t.integer "location_id"
    t.string "name"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.string "review"
    t.integer "user_id"
    t.decimal "star_rating"
    t.integer "location_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "restaurant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.integer "github_uid"
  end

end
