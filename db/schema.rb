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

ActiveRecord::Schema.define(version: 20141223102611) do

  create_table "itemlist", primary_key: "itemno", force: :cascade do |t|
    t.integer "kit",         limit: 1,   null: false
    t.string  "upc",         limit: 20,  null: false
    t.string  "collection",  limit: 255, null: false
    t.string  "description", limit: 255, null: false
    t.string  "category",    limit: 255, null: false
    t.string  "finish",      limit: 255, null: false
    t.string  "material",    limit: 255, null: false
    t.integer "assembly",    limit: 1,   null: false
    t.string  "length",      limit: 11
    t.string  "width",       limit: 11
    t.string  "height",      limit: 11
  end

  add_index "itemlist", ["itemno"], name: "sqlite_autoindex_itemlist_1", unique: true

  create_table "items", force: :cascade do |t|
    t.integer  "itemno"
    t.boolean  "kit"
    t.string   "upc"
    t.string   "collection"
    t.string   "description"
    t.string   "category"
    t.string   "finish"
    t.string   "material"
    t.boolean  "assembly"
    t.string   "length"
    t.string   "width"
    t.string   "height"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "kitlist", id: false, force: :cascade do |t|
    t.integer "itemno", limit: 9,   null: false
    t.string  "name",   limit: 255, null: false
    t.integer "kitno",  limit: 9,   null: false
  end

  create_table "kits", force: :cascade do |t|
    t.integer  "kitno"
    t.integer  "itemno"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "retailers", force: :cascade do |t|
    t.string   "name"
    t.string   "src"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
