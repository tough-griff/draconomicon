# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150703024609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "armors", force: :cascade do |t|
    t.integer  "character_id"
    t.string   "name",                 default: "",            null: false
    t.string   "category",             default: "Light Armor", null: false
    t.string   "cost"
    t.integer  "armor_class"
    t.integer  "minimum_str"
    t.boolean  "stealth_disadvantage"
    t.string   "weight"
    t.text     "description"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "armors", ["character_id"], name: "index_armors_on_character_id", using: :btree

  create_table "characters", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",         default: "",             null: false
    t.string   "slug",                                  null: false
    t.text     "class_levels"
    t.string   "background"
    t.string   "player_name"
    t.string   "race"
    t.string   "alignment",    default: "True Neutral", null: false
    t.integer  "experience",   default: 0
    t.integer  "age"
    t.string   "height"
    t.string   "weight"
    t.string   "eyes"
    t.string   "skin"
    t.string   "hair"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "characters", ["user_id"], name: "index_characters_on_user_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at",                null: false
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "character_id"
    t.string   "name",         default: "", null: false
    t.string   "cost"
    t.string   "weight"
    t.integer  "quantity"
    t.text     "description"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "items", ["character_id"], name: "index_items_on_character_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "",    null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                   default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "name",                   limit: 32, default: "",    null: false
    t.string   "slug",                                              null: false
    t.boolean  "admin",                             default: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "weapons", force: :cascade do |t|
    t.integer  "character_id"
    t.string   "name",           default: "",       null: false
    t.string   "category",       default: "simple", null: false
    t.string   "classification", default: "melee",  null: false
    t.string   "cost"
    t.integer  "attack_bonus"
    t.string   "damage"
    t.string   "damage_type"
    t.string   "weight"
    t.text     "properties"
    t.text     "description"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "weapons", ["character_id"], name: "index_weapons_on_character_id", using: :btree

end
