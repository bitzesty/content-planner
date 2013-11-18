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

ActiveRecord::Schema.define(version: 20131120135514) do

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "content_plan_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "content_plans", force: true do |t|
    t.string   "type"
    t.integer  "size"
    t.string   "status"
    t.string   "ref_no"
    t.string   "title"
    t.text     "details"
    t.string   "slug"
    t.text     "content_type"
    t.text     "sources"
    t.text     "handover_detailed_guidance"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "source_url_content_plans", force: true do |t|
    t.integer "source_url_id"
    t.integer "content_plan_id"
  end

  create_table "source_urls", force: true do |t|
    t.text     "from_url"
    t.boolean  "needs_assigned",        default: false
    t.boolean  "content_plan_assigned", default: false
    t.boolean  "archive",               default: false
    t.boolean  "transitioned",          default: false
    t.text     "to_url"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "source_urls", ["archive"], name: "index_source_urls_on_archive", using: :btree
  add_index "source_urls", ["content_plan_assigned"], name: "index_source_urls_on_content_plan_assigned", using: :btree
  add_index "source_urls", ["department_id"], name: "index_source_urls_on_department_id", using: :btree
  add_index "source_urls", ["needs_assigned"], name: "index_source_urls_on_needs_assigned", using: :btree
  add_index "source_urls", ["transitioned"], name: "index_source_urls_on_transitioned", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "tasks", force: true do |t|
    t.string   "title"
    t.boolean  "done"
    t.integer  "content_plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",               default: "",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "uid"
    t.string   "organisation_slug"
    t.string   "permissions"
    t.boolean  "remotely_signed_out", default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["organisation_slug"], name: "index_users_on_organisation_slug", using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
    t.string   "user_name"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
