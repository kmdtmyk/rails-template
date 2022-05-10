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

ActiveRecord::Schema.define(version: 2019_11_08_023142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_reviews", force: :cascade do |t|
    t.bigint "book_id"
    t.text "content"
    t.bigint "create_user_id"
    t.bigint "update_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_book_reviews_on_book_id"
    t.index ["create_user_id"], name: "index_book_reviews_on_create_user_id"
    t.index ["update_user_id"], name: "index_book_reviews_on_update_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.date "release_date"
    t.bigint "create_user_id"
    t.bigint "update_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["create_user_id"], name: "index_books_on_create_user_id"
    t.index ["update_user_id"], name: "index_books_on_update_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "search_name"
    t.string "furigana"
    t.string "search_furigana"
    t.integer "price"
    t.bigint "create_user_id"
    t.bigint "update_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["create_user_id"], name: "index_items_on_create_user_id"
    t.index ["update_user_id"], name: "index_items_on_update_user_id"
  end

  create_table "notices", comment: "お知らせ", force: :cascade do |t|
    t.string "title", comment: "タイトル"
    t.text "body", comment: "本文"
    t.datetime "publish_start_datetime", comment: "公開開始日時"
    t.datetime "publish_end_datetime", comment: "公開終了日時"
    t.bigint "create_user_id", comment: "作成者id"
    t.bigint "update_user_id", comment: "更新者id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["create_user_id"], name: "index_notices_on_create_user_id"
    t.index ["update_user_id"], name: "index_notices_on_update_user_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "item_id"
    t.string "item_name"
    t.integer "item_price"
    t.integer "quantity"
    t.integer "total_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_order_details_on_item_id"
    t.index ["order_id"], name: "index_order_details_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.date "date"
    t.integer "total_price"
    t.text "comment"
    t.bigint "create_user_id"
    t.bigint "update_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["create_user_id"], name: "index_orders_on_create_user_id"
    t.index ["update_user_id"], name: "index_orders_on_update_user_id"
  end

  create_table "rparam_memories", force: :cascade do |t|
    t.string "user_type"
    t.bigint "user_id"
    t.string "action"
    t.text "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_type", "user_id"], name: "index_rparam_memories_on_user_type_and_user_id"
  end

  create_table "users", comment: "ユーザ", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "username", comment: "ユーザ名"
    t.string "name", comment: "氏名"
    t.string "search_name", comment: "検索用氏名"
    t.string "furigana", comment: "ふりがな"
    t.string "search_furigana", comment: "検索用ふりがな"
    t.datetime "password_change_datetime", comment: "パスワード変更日時"
    t.boolean "admin", default: false, null: false, comment: "管理者"
    t.string "jti"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "book_reviews", "books"
  add_foreign_key "order_details", "orders"
end
