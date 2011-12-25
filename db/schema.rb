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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111225200340) do

  create_table "collections", :force => true do |t|
    t.integer  "group_id"
    t.integer  "unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collections", ["group_id"], :name => "index_collections_on_group_id"
  add_index "collections", ["unit_id"], :name => "index_collections_on_unit_id"

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.text     "details"
    t.boolean  "in"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", :force => true do |t|
    t.integer  "item_id"
    t.text     "details"
    t.boolean  "in",         :default => true
    t.boolean  "active",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "remarks"
  end

  add_index "units", ["item_id"], :name => "index_units_on_item_id"

end
