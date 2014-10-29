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

ActiveRecord::Schema.define(version: 20141029012807) do

  create_table "charities", force: true do |t|
    t.string   "name"
    t.string   "tax_number"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "charities", ["tax_number", "active"], name: "index_charities_on_tax_number_and_active"
  add_index "charities", ["tax_number"], name: "index_charities_on_tax_number"

  create_table "pages", force: true do |t|
    t.string   "name"
    t.integer  "charity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["charity_id"], name: "index_pages_on_charity_id"

end
