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

ActiveRecord::Schema.define(:version => 20101114123519) do

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number"
    t.string   "title"
    t.text     "description"
    t.string   "lacturer"
    t.string   "term"
  end

  create_table "exams", :force => true do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.float    "result"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number"
    t.string   "location"
    t.date     "date"
    t.string   "examiner"
    t.integer  "credit_points"
    t.text     "requirements"
    t.integer  "attempt"
    t.date     "registered_at"
    t.date     "canceled_at"
  end

  create_table "students", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "matriculation_number"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthday"
    t.string   "place_of_birth"
    t.string   "study_course"
    t.string   "nationality"
    t.integer  "current_term",         :default => 0
    t.string   "street"
    t.string   "house_number"
    t.integer  "zip_code"
    t.string   "city"
  end

end
