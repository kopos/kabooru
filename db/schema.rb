# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 4) do

  create_table "activities", :force => true do |t|
    t.integer  "asset_id"
    t.string   "action"
    t.integer  "user_id"
    t.datetime "time"
  end

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.integer  "asset_id"
    t.integer  "user_id"
    t.integer  "rating"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", :force => true do |t|
    t.string   "title",      :limit => 80
    t.text     "content"
    t.integer  "version"
    t.datetime "time"
    t.integer  "asset_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets", :force => true do |t|
    t.integer  "type_id",    :null => false
    t.integer  "mail_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets_classes", :force => true do |t|
    t.integer "asset_id"
    t.integer "class_id"
  end

  create_table "assets_tags", :id => false, :force => true do |t|
    t.integer "asset_id"
    t.integer "tag_id"
  end

  create_table "classes", :force => true do |t|
    t.string   "name",       :limit => 100, :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "asset_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discussions", :force => true do |t|
    t.integer  "asset_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", :force => true do |t|
    t.string   "title",      :limit => 80
    t.string   "file_name",  :limit => 250
    t.binary   "content"
    t.string   "mime"
    t.integer  "version"
    t.integer  "asset_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feeds", :force => true do |t|
    t.integer  "asset_id"
    t.string   "title",      :limit => 80
    t.string   "feed_uri",   :limit => 250
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name",       :default => "", :null => false
    t.string   "type",       :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", :force => true do |t|
    t.string   "url",        :limit => 250
    t.string   "title",      :limit => 80
    t.integer  "asset_id"
    t.integer  "user_id"
    t.string   "short_desc", :limit => 200
    t.string   "notes",      :limit => 500
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mails", :force => true do |t|
    t.string   "title"
    t.integer  "from_mail_id"
    t.text     "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", :force => true do |t|
    t.string   "rwx_perms"
    t.integer  "asset_id"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.string   "small"
    t.text     "big"
    t.integer  "asset_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "name",       :limit => 100, :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", :force => true do |t|
    t.string   "name",       :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email_id",                                :default => "", :null => false
    t.string   "password"
    t.string   "first_name",                              :default => "", :null => false
    t.string   "middle_name"
    t.string   "last_name",                               :default => "", :null => false
    t.string   "name",                                    :default => "", :null => false
    t.string   "telephone",                 :limit => 50
    t.string   "mobile_phone",              :limit => 50
    t.string   "job_title"
    t.date     "date_of_birth"
    t.string   "gender",                    :limit => 1
    t.string   "gmail_id"
    t.string   "yahoo_id"
    t.string   "hotmail_id"
    t.string   "skype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt",                      :limit => 40
    t.string   "crypted_password",          :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

  create_table "users_groups", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
