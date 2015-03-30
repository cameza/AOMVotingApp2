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

ActiveRecord::Schema.define(version: 20150330052451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "members", force: true do |t|
    t.string   "mail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "voted"
  end

  create_table "nominees", force: true do |t|
    t.string   "mail"
    t.string   "name"
    t.text     "cv"
    t.text     "statement"
    t.boolean  "committee_check"
    t.boolean  "chairman_check"
    t.integer  "confirmed"
    t.integer  "not_confirmed"
    t.string   "abstained"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
    t.string   "nominator_mail"
    t.integer  "committee_check_count"
    t.integer  "vote_id"
  end

  create_table "votes", force: true do |t|
    t.string   "vote_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
