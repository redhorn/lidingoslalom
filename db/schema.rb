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

ActiveRecord::Schema.define(:version => 20121119093632) do

  create_table "attendances", :force => true do |t|
    t.integer  "member_id"
    t.integer  "practice_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "attended"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "name"
    t.integer  "group_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "parent_name"
    t.string   "parent_phone"
    t.string   "parent_email"
    t.date     "dateofbirth"
  end

  create_table "practices", :force => true do |t|
    t.date     "date"
    t.string   "location"
    t.string   "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "group_id"
    t.date     "starts_at"
    t.date     "ends_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
