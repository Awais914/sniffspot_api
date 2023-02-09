# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< Updated upstream
ActiveRecord::Schema[7.0].define(version: 2023_02_09_101022) do
=======
ActiveRecord::Schema[7.0].define(version: 2023_02_09_133923) do
>>>>>>> Stashed changes
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "images", force: :cascade do |t|
    t.bigint "spot_id", null: false
    t.string "link", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_images_on_spot_id"
  end

<<<<<<< Updated upstream
=======
  create_table "reviews", force: :cascade do |t|
    t.bigint "spot_id", null: false
    t.text "content"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_reviews_on_spot_id"
  end

>>>>>>> Stashed changes
  create_table "spots", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.float "price", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "images", "spots"
<<<<<<< Updated upstream
=======
  add_foreign_key "reviews", "spots"
>>>>>>> Stashed changes
end
