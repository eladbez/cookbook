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

ActiveRecord::Schema.define(version: 20140723095228) do

  create_table "belongings", force: true do |t|
    t.integer  "user_id"
    t.integer  "dish_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "belongings", ["user_id", "dish_id"], name: "index_belongings_on_user_id_and_dish_id", using: :btree

  create_table "courses", force: true do |t|
    t.integer  "dish_id"
    t.integer  "feast_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["dish_id", "feast_id"], name: "index_courses_on_dish_id_and_feast_id", using: :btree

  create_table "dishes", force: true do |t|
    t.string   "name"
    t.string   "taste"
    t.string   "culture"
    t.string   "mealpart"
    t.text     "recipe"
    t.text     "health_value"
    t.string   "img_source"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "feast_id"
    t.integer  "user_id"
    t.binary   "image"
    t.boolean  "shared",       default: true
  end

  add_index "dishes", ["feast_id"], name: "index_dishes_on_feast_id", using: :btree
  add_index "dishes", ["user_id"], name: "index_dishes_on_user_id", using: :btree

  create_table "feast_invts", force: true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.integer  "feast_id"
    t.boolean  "manager",     default: false
    t.datetime "updated_at"
    t.datetime "created_at"
    t.boolean  "answered",    default: false
  end

  create_table "feasts", force: true do |t|
    t.integer  "cost"
    t.string   "feast_place"
    t.datetime "feast_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "name",        default: "has no name"
    t.text     "content"
  end

  create_table "friend_invts", force: true do |t|
    t.integer  "feast_id"
    t.integer  "receiver_id"
    t.integer  "sender_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["user_id", "friend_id"], name: "index_friendships_on_user_id_and_friend_id", using: :btree

  create_table "groceries", force: true do |t|
    t.string   "name"
    t.string   "measure"
    t.string   "quantity"
    t.integer  "feast_id"
    t.integer  "dish_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groceries", ["dish_id"], name: "index_groceries_on_dish_id", using: :btree
  add_index "groceries", ["feast_id"], name: "index_groceries_on_feast_id", using: :btree

  create_table "mails", force: true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "messege_id"
  end

  add_index "mails", ["receiver_id", "sender_id"], name: "index_mails_on_receiver_id_and_sender_id", using: :btree

  create_table "messeges", force: true do |t|
    t.text     "content"
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "receiver_id"
    t.integer  "sender_id"
    t.boolean  "news?"
  end

  add_index "messeges", ["receiver_id"], name: "index_messeges_on_receiver_id", using: :btree
  add_index "messeges", ["sender_id"], name: "index_messeges_on_sender_id", using: :btree

  create_table "obligations", force: true do |t|
    t.integer  "dish_id"
    t.integer  "participation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "agreed"
  end

  add_index "obligations", ["dish_id", "participation_id"], name: "index_obligations_on_dish_id_and_participation_id", using: :btree

  create_table "participations", force: true do |t|
    t.integer  "user_id"
    t.integer  "feast_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_costs"
    t.boolean  "accepted"
    t.string   "coming",     default: "invitation sent"
    t.boolean  "manager",    default: false
  end

  add_index "participations", ["user_id", "feast_id"], name: "index_participations_on_user_id_and_feast_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "image"
    t.text     "content"
    t.datetime "last_visit"
    t.integer  "postable_id"
    t.string   "postable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["postable_type", "postable_id"], name: "index_posts_on_postable_type_and_postable_id", using: :btree

  create_table "replies", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "replies", ["post_id"], name: "index_replies_on_post_id", using: :btree
  add_index "replies", ["user_id"], name: "index_replies_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",            limit: 75
    t.string   "password",        limit: 40
    t.string   "email",                      default: "", null: false
    t.string   "hashed_password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shop_cost"
    t.string   "salt"
    t.string   "city"
    t.string   "street_num"
    t.string   "entrance"
    t.string   "level"
    t.string   "apartment_num"
    t.string   "neighborhood"
    t.string   "kosher"
    t.string   "image"
  end

end
