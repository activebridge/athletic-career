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

ActiveRecord::Schema.define(version: 20161025072733) do

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

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.index ["slug"], name: "index_articles_on_slug", unique: true, using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string  "title"
    t.boolean "visible", default: false
  end

  create_table "competitions", force: :cascade do |t|
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
    t.integer  "year"
    t.integer  "event_id"
    t.integer  "distance_id"
    t.string   "city"
    t.index ["distance_id"], name: "index_competitions_on_distance_id", using: :btree
    t.index ["event_id"], name: "index_competitions_on_event_id", using: :btree
    t.index ["user_id"], name: "index_competitions_on_user_id", using: :btree
  end

  create_table "distances", force: :cascade do |t|
    t.integer "price"
    t.integer "end_price"
    t.integer "event_id"
    t.integer "length_id"
    t.index ["event_id"], name: "index_distances_on_event_id", using: :btree
    t.index ["length_id"], name: "index_distances_on_length_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "site"
    t.string   "logo"
    t.string   "city"
    t.date     "date"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "banner"
    t.boolean  "visible",      default: false
    t.integer  "category_id"
    t.integer  "organizer_id"
    t.string   "country"
    t.string   "slug"
    t.index ["category_id"], name: "index_events_on_category_id", using: :btree
    t.index ["organizer_id"], name: "index_events_on_organizer_id", using: :btree
    t.index ["slug"], name: "index_events_on_slug", unique: true, using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "lengths", force: :cascade do |t|
    t.string  "title"
    t.boolean "visible", default: false
    t.integer "mark",    default: 1000
    t.string  "logo"
    t.string  "name"
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
    t.string   "slug"
    t.string   "gender"
    t.string   "profile"
    t.string   "city"
    t.integer  "category"
    t.index ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  end

  add_foreign_key "competitions", "distances"
  add_foreign_key "competitions", "events"
  add_foreign_key "distances", "events"
  add_foreign_key "distances", "lengths"
  add_foreign_key "events", "categories"
  add_foreign_key "events", "organizers"
end
