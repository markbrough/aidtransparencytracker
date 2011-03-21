# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110320230319) do

  create_table "activities", :force => true do |t|
    t.integer   "question_id"
    t.integer   "published"
    t.string    "system"
    t.text      "evidence"
    t.text      "comments"
    t.integer   "response_id"
    t.date      "entry_date"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string    "name"
    t.text      "description"
    t.integer   "recipient"
    t.integer   "donor"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "data_countries", :force => true do |t|
    t.integer   "question_id"
    t.integer   "published"
    t.string    "system"
    t.text      "evidence"
    t.text      "comments"
    t.integer   "response_id"
    t.date      "entry_date"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "data_organisations", :force => true do |t|
    t.integer   "question_id"
    t.integer   "published"
    t.text      "evidence"
    t.text      "comments"
    t.integer   "response_id"
    t.date      "entry_date"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "donors", :force => true do |t|
    t.string    "name"
    t.integer   "country_id"
    t.text      "description"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "question_types", :force => true do |t|
    t.string    "name"
    t.text      "description"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.text      "question_long"
    t.string    "question_short"
    t.text      "description"
    t.text      "example"
    t.integer   "question_type"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "responses", :force => true do |t|
    t.integer   "user_id"
    t.integer   "donor_id"
    t.integer   "recipient_id"
    t.integer   "response_type"
    t.date      "entry_date"
    t.text      "description"
    t.integer   "status"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.date      "updated_date"
    t.date      "submitted_date"
    t.integer   "related_to"
  end

  create_table "users", :force => true do |t|
    t.string    "login"
    t.string    "email"
    t.string    "crypted_password"
    t.string    "password_salt"
    t.string    "persistence_token"
    t.string    "single_access_token"
    t.string    "perishable_token"
    t.integer   "login_count"
    t.integer   "failed_login_count"
    t.timestamp "last_request_at"
    t.timestamp "current_login_at"
    t.timestamp "last_login_at"
    t.string    "current_login_ip"
    t.string    "last_login_ip"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "role"
    t.string    "organisation_name"
    t.integer   "country_id"
  end

end
