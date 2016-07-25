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

ActiveRecord::Schema.define(version: 20160725114514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id", using: :btree
  end

  create_table "admins", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "email"
    t.integer  "role"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_admins_on_email", using: :btree
    t.index ["user_id"], name: "index_admins_on_user_id", using: :btree
  end

  create_table "careers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "race"
    t.string   "distance"
    t.integer  "race_number"
    t.time     "result"
    t.time     "net_result"
    t.integer  "rank"
    t.integer  "category_rank"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_careers_on_user_id", using: :btree
  end

  create_table "distances", force: :cascade do |t|
    t.string  "title"
    t.integer "price"
    t.integer "end_price"
    t.date    "buy_ticket"
    t.date    "buy_ticket_end"
    t.boolean "visible",        default: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.string   "site"
    t.string   "logo"
    t.string   "place"
    t.date     "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "banner"
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "lengths", force: :cascade do |t|
    t.string  "title"
    t.boolean "visible", default: false
  end

  create_table "organizers", force: :cascade do |t|
    t.string  "title"
    t.boolean "visible", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "avatar"
    t.string   "email"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "role",       default: 0
  end

end
