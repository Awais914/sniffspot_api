ActiveRecord::Schema[7.0].define(version: 2023_02_09_133923) do
  enable_extension "plpgsql"

  create_table "images", force: :cascade do |t|
    t.bigint "spot_id", null: false
    t.string "link", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_images_on_spot_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "spot_id", null: false
    t.text "content"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_reviews_on_spot_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.float "price", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "images", "spots"
  add_foreign_key "reviews", "spots"
end
