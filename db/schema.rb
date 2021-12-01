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

ActiveRecord::Schema.define(version: 2021_11_30_045847) do

  create_table "cart_items", id: false, force: :cascade do |t|
    t.integer "cart_id"
    t.integer "game_id"
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["game_id"], name: "index_cart_items_on_game_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "developers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "game_developers", id: false, force: :cascade do |t|
    t.integer "game_id"
    t.integer "developer_id"
    t.index ["developer_id"], name: "index_game_developers_on_developer_id"
    t.index ["game_id"], name: "index_game_developers_on_game_id"
  end

  create_table "game_genres", id: false, force: :cascade do |t|
    t.integer "game_id"
    t.integer "genre_id"
    t.index ["game_id"], name: "index_game_genres_on_game_id"
    t.index ["genre_id"], name: "index_game_genres_on_genre_id"
  end

  create_table "game_publishers", id: false, force: :cascade do |t|
    t.integer "game_id"
    t.integer "publisher_id"
    t.index ["game_id"], name: "index_game_publishers_on_game_id"
    t.index ["publisher_id"], name: "index_game_publishers_on_publisher_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "release_date"
    t.decimal "price", precision: 5, scale: 2
    t.integer "discount", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.decimal "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_orders_on_game_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.integer "rating"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_reviews_on_game_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["username", "email"], name: "index_users_on_username_and_email", unique: true
  end

end
