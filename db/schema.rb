# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20210526213616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  create_table "instagram_images", force: :cascade do |t|
    t.integer  "instagram_id"
    t.string   "code"
    t.string   "thumbnail_src"
    t.string   "display_src"
    t.string   "display_src_image"
    t.string   "thumbnail_src_image"
    t.datetime "post_date"
    t.boolean  "show",                default: true
    t.string   "video_url"
    t.boolean  "is_video"
    t.index ["instagram_id", "code"], name: "index_instagram_images_on_instagram_id_and_code", unique: true, using: :btree
  end

  create_table "main_header_images", force: :cascade do |t|
    t.integer "position"
    t.string  "image"
  end

  create_table "promos", force: :cascade do |t|
    t.string  "name"
    t.integer "position"
    t.string  "image"
  end

  create_table "services", force: :cascade do |t|
    t.string  "name"
    t.integer "position"
    t.string  "description"
    t.string  "image"
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "name"
    t.datetime "date"
    t.string   "card_type"
    t.string   "provider"
    t.float    "amount"
    t.integer  "payment_count"
    t.string   "payment_batch"
    t.string   "payment_coupon"
    t.integer  "receipt_number"
    t.integer  "credit_card_last_digits"
  end

end
