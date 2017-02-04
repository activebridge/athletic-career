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

ActiveRecord::Schema.define(version: 20170204163947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "banners", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.boolean  "visible",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "priority",   default: 0
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
    t.string  "title"
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

  create_table "members", force: :cascade do |t|
    t.integer  "organizer_id"
    t.string   "avatar"
    t.string   "name"
    t.string   "position"
    t.string   "bio"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "email"
    t.string   "phone"
    t.index ["organizer_id"], name: "index_members_on_organizer_id", using: :btree
  end

  create_table "organizers", force: :cascade do |t|
    t.string  "title"
    t.boolean "visible",     default: false
    t.string  "logo"
    t.string  "site"
    t.string  "description"
  end

  create_table "personal_bests", force: :cascade do |t|
    t.integer  "user_id"
    t.time     "km5"
    t.time     "km10"
    t.time     "km15"
    t.time     "half"
    t.time     "marathon"
    t.time     "ultra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_personal_bests_on_user_id", using: :btree
  end

  create_table "protocols", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name_ua"
    t.string   "last_name_ua"
    t.string   "first_name_ru"
    t.string   "last_name_ru"
    t.string   "first_name_en"
    t.string   "last_name_en"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.datetime "birthday"
    t.index ["user_id"], name: "index_protocols_on_user_id", using: :btree
  end

  create_table "results", force: :cascade do |t|
    t.integer  "distance_id"
    t.string   "name"
    t.integer  "bib_number"
    t.integer  "age"
    t.string   "category"
    t.time     "gun_time"
    t.time     "chip_time"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "position"
    t.string   "category_position"
    t.boolean  "gender"
    t.index ["age"], name: "index_results_on_age", using: :btree
    t.index ["bib_number"], name: "index_results_on_bib_number", using: :btree
    t.index ["category"], name: "index_results_on_category", using: :btree
    t.index ["distance_id"], name: "index_results_on_distance_id", using: :btree
    t.index ["name"], name: "index_results_on_name", using: :btree
  end

  create_table "sm_links", force: :cascade do |t|
    t.string   "sm_linkable_type"
    t.integer  "sm_linkable_id"
    t.string   "type"
    t.string   "facebook"
    t.string   "vk"
    t.string   "google"
    t.string   "twitter"
    t.string   "instagram"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["sm_linkable_id", "sm_linkable_type"], name: "index_sm_links_on_sm_linkable_id_and_sm_linkable_type", using: :btree
    t.index ["sm_linkable_type", "sm_linkable_id"], name: "index_sm_links_on_sm_linkable_type_and_sm_linkable_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "avatar"
    t.string   "email"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "role",         default: 0
    t.string   "slug"
    t.string   "gender"
    t.string   "profile"
    t.string   "city"
    t.integer  "category"
    t.integer  "organizer_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.index ["organizer_id"], name: "index_users_on_organizer_id", using: :btree
    t.index ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  end

  add_foreign_key "competitions", "distances"
  add_foreign_key "competitions", "events"
  add_foreign_key "distances", "events"
  add_foreign_key "distances", "lengths"
  add_foreign_key "events", "categories"
  add_foreign_key "events", "organizers"
end
