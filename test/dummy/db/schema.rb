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

ActiveRecord::Schema.define(:version => 20130929095519) do

  create_table "auto_sequences", :force => true do |t|
    t.string   "seq_name"
    t.string   "criteria"
    t.integer  "start_with"
    t.integer  "step_by"
    t.integer  "next_val"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "auto_sequences", ["seq_name", "criteria"], :name => "index_auto_sequences_on_seq_name_and_criteria", :unique => true

end
