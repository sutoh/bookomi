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

ActiveRecord::Schema.define(version: 20150306011926) do

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "manga_tags", force: :cascade do |t|
    t.integer  "manga_id",   limit: 4
    t.integer  "tag_id",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "manga_tags", ["manga_id"], name: "index_manga_tags_on_manga_id"
  add_index "manga_tags", ["tag_id"], name: "index_manga_tags_on_tag_id"

  create_table "mangas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.integer  "manga_id",          limit: 4
    t.string   "tweet_id",          limit: 255
    t.text     "image_urls",        limit: 65535
    t.string   "user_name",         limit: 255
    t.string   "screen_name",       limit: 255
    t.text     "tweet",             limit: 65535
    t.datetime "tweeted_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.text     "backup_image_urls"
    t.text     "backup_deletes"
  end

  add_index "tweets", ["manga_id"], name: "index_tweets_on_manga_id"
  add_index "tweets", ["tweet_id"], name: "index_tweets_on_tweet_id", unique: true

end
