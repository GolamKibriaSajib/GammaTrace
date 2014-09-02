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

ActiveRecord::Schema.define(version: 20140901070828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "config", id: false, force: true do |t|
    t.string "key",   limit: 50, null: false
    t.string "value", limit: 50
  end

  create_table "data", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interest_swap", id: false, force: true do |t|
    t.integer "dissemination_id",                                   limit: 8,   null: false
    t.string  "original_dissemination_id",                          limit: nil
    t.string  "action",                                             limit: nil
    t.integer "execution_timestamp",                                limit: 8
    t.string  "cleared",                                            limit: nil
    t.string  "indication_of_collateralization",                    limit: nil
    t.string  "indication_of_end_user_exception",                   limit: nil
    t.string  "indication_of_other_price_affecting_term",           limit: nil
    t.string  "block_trades_and_large_notional_off_facility_swaps", limit: nil
    t.string  "execution_venue",                                    limit: nil
    t.integer "effective_date",                                     limit: 8
    t.integer "end_date",                                           limit: 8
    t.string  "day_count_convention",                               limit: nil
    t.string  "settlement_currency",                                limit: nil
    t.string  "asset_class",                                        limit: nil
    t.string  "sub_asset_class_for_other_commodity",                limit: nil
    t.string  "taxonomy",                                           limit: nil
    t.string  "price_forming_continuation_data",                    limit: nil
    t.string  "underlying_asset_1",                                 limit: nil
    t.string  "underlying_asset_2",                                 limit: nil
    t.string  "price_notation_type",                                limit: nil
    t.float   "price_notation"
    t.string  "additional_price_notation_type",                     limit: nil
    t.string  "additional_price_notation",                          limit: nil
    t.string  "notional_currency_1",                                limit: nil
    t.string  "notional_currency_2",                                limit: nil
    t.string  "rounded_notional_amount_1",                          limit: nil
    t.string  "rounded_notional_amount_2",                          limit: nil
    t.string  "payment_frequency_1",                                limit: nil
    t.string  "payment_frequency_2",                                limit: nil
    t.string  "reset_frequency_1",                                  limit: nil
    t.string  "reset_frequency_2",                                  limit: nil
    t.string  "embeded_option",                                     limit: nil
    t.float   "option_strike_price"
    t.string  "option_type",                                        limit: nil
    t.string  "option_family",                                      limit: nil
    t.string  "option_currency",                                    limit: nil
    t.float   "option_premium"
    t.string  "option_lock_period",                                 limit: nil
    t.integer "option_expiration_date",                             limit: 8
    t.string  "price_notation2_type",                               limit: nil
    t.float   "price_notation2"
    t.string  "price_notation3_type",                               limit: nil
    t.float   "price_notation3"
    t.integer "user_id"
  end

  add_index "interest_swap", ["user_id"], name: "index_interest_swap_on_user_id", using: :btree

  create_table "searches", force: true do |t|
    t.string   "cleared"
    t.string   "indication_of_collateralization"
    t.string   "indication_of_end_user_exception"
    t.string   "execution_venue"
    t.integer  "effective_date"
    t.integer  "end_date"
    t.string   "settlement_currency"
    t.string   "notional_currency_1"
    t.string   "notional_currency_2"
    t.string   "rounded_notional_amount_1"
    t.integer  "rounded_notional_amount_2"
    t.integer  "option_strike_price"
    t.string   "option_type"
    t.string   "option_premium"
    t.integer  "option_expiration_date"
    t.string   "floating_leg_reset"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "user_id"
    t.string   "taxonomy"
  end

  add_index "searches", ["user_id"], name: "index_searches_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "views", force: true do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "views", ["user_id"], name: "index_views_on_user_id", using: :btree

end
