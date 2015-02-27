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

ActiveRecord::Schema.define(version: 20141222054000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "config", id: false, force: :cascade do |t|
    t.string "key",   limit: 50, null: false
    t.string "value", limit: 50
  end

  create_table "data", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interest_swap", primary_key: "dissemination_id", force: :cascade do |t|
    t.string  "original_dissemination_id"
    t.string  "action"
    t.integer "execution_timestamp",                                limit: 8
    t.string  "cleared"
    t.string  "indication_of_collateralization"
    t.string  "indication_of_end_user_exception"
    t.string  "indication_of_other_price_affecting_term"
    t.string  "block_trades_and_large_notional_off_facility_swaps"
    t.string  "execution_venue"
    t.integer "effective_date",                                     limit: 8
    t.integer "end_date",                                           limit: 8
    t.string  "day_count_convention"
    t.string  "settlement_currency"
    t.string  "asset_class"
    t.string  "sub_asset_class_for_other_commodity"
    t.string  "taxonomy"
    t.string  "price_forming_continuation_data"
    t.string  "underlying_asset_1"
    t.string  "underlying_asset_2"
    t.string  "price_notation_type"
    t.float   "price_notation"
    t.string  "additional_price_notation_type"
    t.float   "additional_price_notation"
    t.string  "notional_currency_1"
    t.string  "notional_currency_2"
    t.integer "rounded_notional_amount_1",                          limit: 8
    t.boolean "rounded_notional_overflow_flag_1"
    t.integer "rounded_notional_amount_2",                          limit: 8
    t.boolean "rounded_notional_overflow_flag_2"
    t.string  "payment_frequency_1"
    t.string  "payment_frequency_2"
    t.string  "reset_frequency_1"
    t.string  "reset_frequency_2"
    t.string  "embeded_option"
    t.float   "option_strike_price"
    t.string  "option_type"
    t.string  "option_family"
    t.string  "option_currency"
    t.float   "option_premium"
    t.string  "option_lock_period"
    t.integer "option_expiration_date",                             limit: 8
    t.string  "price_notation2_type"
    t.float   "price_notation2"
    t.string  "price_notation3_type"
    t.float   "price_notation3"
  end

  create_table "metric_interestrate_capfloor", primary_key: "dissemination_id", force: :cascade do |t|
    t.integer "execution_timestamp",              limit: 8
    t.string  "settlement_currency"
    t.integer "option_expiration_date",           limit: 8
    t.integer "effective_date",                   limit: 8
    t.integer "end_date",                         limit: 8
    t.integer "rounded_notional_amount_1",        limit: 8
    t.boolean "rounded_notional_overflow_flag_1"
    t.string  "option_type"
    t.float   "option_strike_price"
    t.string  "underlying_asset_1"
    t.string  "underlying_asset_2"
    t.string  "reset_frequency_1"
    t.string  "reset_frequency_2"
    t.string  "cleared"
    t.string  "indication_of_collateralization"
    t.string  "indication_of_end_user_exception"
    t.string  "execution_venue"
    t.string  "spread_delta"
    t.string  "fixed_delta"
    t.string  "vega_matrix"
    t.float   "volatility"
  end

  create_table "metric_interestrate_crosscurrency_basis", primary_key: "dissemination_id", force: :cascade do |t|
    t.integer "execution_timestamp",              limit: 8
    t.string  "notional_currency_1"
    t.string  "notional_currency_2"
    t.integer "effective_date",                   limit: 8
    t.integer "end_date",                         limit: 8
    t.integer "rounded_notional_amount_1",        limit: 8
    t.boolean "rounded_notional_overflow_flag_1"
    t.integer "rounded_notional_amount_2",        limit: 8
    t.boolean "rounded_notional_overflow_flag_2"
    t.string  "cleared"
    t.string  "indication_of_collateralization"
    t.string  "indication_of_end_user_exception"
    t.string  "execution_venue"
    t.float   "common_fixed_fair_rate"
    t.float   "end_date_fixed_fair_rate"
    t.float   "effective_date_fixed_fair_rate"
    t.string  "spread_delta"
    t.string  "fixed_delta"
    t.string  "xccy_delta"
  end

  create_table "metric_interestrate_crosscurrency_fixedfixed", primary_key: "dissemination_id", force: :cascade do |t|
    t.integer "execution_timestamp",              limit: 8
    t.string  "notional_currency_1"
    t.string  "notional_currency_2"
    t.integer "effective_date",                   limit: 8
    t.integer "end_date",                         limit: 8
    t.integer "rounded_notional_amount_1",        limit: 8
    t.boolean "rounded_notional_overflow_flag_1"
    t.integer "rounded_notional_amount_2",        limit: 8
    t.boolean "rounded_notional_overflow_flag_2"
    t.string  "cleared"
    t.string  "indication_of_collateralization"
    t.string  "indication_of_end_user_exception"
    t.string  "execution_venue"
    t.float   "common_fixed_fair_rate"
    t.float   "end_date_fixed_fair_rate"
    t.float   "effective_date_fixed_fair_rate"
    t.string  "spread_delta"
    t.string  "fixed_delta"
    t.string  "xccy_delta"
  end

  create_table "metric_interestrate_crosscurrency_fixedfloat", primary_key: "dissemination_id", force: :cascade do |t|
    t.integer "execution_timestamp",              limit: 8
    t.string  "notional_currency_1"
    t.string  "notional_currency_2"
    t.integer "effective_date",                   limit: 8
    t.integer "end_date",                         limit: 8
    t.integer "rounded_notional_amount_1",        limit: 8
    t.boolean "rounded_notional_overflow_flag_1"
    t.integer "rounded_notional_amount_2",        limit: 8
    t.boolean "rounded_notional_overflow_flag_2"
    t.string  "cleared"
    t.string  "indication_of_collateralization"
    t.string  "indication_of_end_user_exception"
    t.string  "execution_venue"
    t.float   "common_fixed_fair_rate"
    t.float   "end_date_fixed_fair_rate"
    t.float   "effective_date_fixed_fair_rate"
    t.string  "spread_delta"
    t.string  "fixed_delta"
    t.string  "xccy_delta"
  end

  create_table "metric_interestrate_irswap_basis", primary_key: "dissemination_id", force: :cascade do |t|
    t.integer "execution_timestamp",              limit: 8
    t.string  "settlement_currency"
    t.integer "effective_date",                   limit: 8
    t.integer "end_date",                         limit: 8
    t.integer "rounded_notional_amount_1",        limit: 8
    t.boolean "rounded_notional_overflow_flag_1"
    t.string  "cleared"
    t.string  "indication_of_collateralization"
    t.string  "indication_of_end_user_exception"
    t.string  "execution_venue"
    t.float   "common_fixed_fair_rate"
    t.float   "end_date_fixed_fair_rate"
    t.float   "effective_date_fixed_fair_rate"
    t.string  "spread_delta"
    t.string  "fixed_delta"
  end

  create_table "metric_interestrate_irswap_fixedfloat", primary_key: "dissemination_id", force: :cascade do |t|
    t.integer "execution_timestamp",              limit: 8
    t.string  "settlement_currency"
    t.integer "effective_date",                   limit: 8
    t.integer "end_date",                         limit: 8
    t.string  "underlying_asset_1"
    t.string  "underlying_asset_2"
    t.integer "rounded_notional_amount_1",        limit: 8
    t.boolean "rounded_notional_overflow_flag_1"
    t.string  "reset_frequency_1"
    t.string  "reset_frequency_2"
    t.string  "cleared"
    t.string  "indication_of_collateralization"
    t.string  "indication_of_end_user_exception"
    t.string  "execution_venue"
    t.float   "common_fixed_fair_rate"
    t.float   "end_date_fixed_fair_rate"
    t.float   "effective_date_fixed_fair_rate"
    t.string  "spread_delta"
    t.string  "fixed_delta"
  end

  create_table "metric_interestrate_irswap_fixedfloats", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metric_interestrate_irswap_ois", primary_key: "dissemination_id", force: :cascade do |t|
    t.integer "execution_timestamp",              limit: 8
    t.string  "settlement_currency"
    t.integer "effective_date",                   limit: 8
    t.integer "end_date",                         limit: 8
    t.integer "rounded_notional_amount_1",        limit: 8
    t.boolean "rounded_notional_overflow_flag_1"
    t.string  "cleared"
    t.string  "indication_of_collateralization"
    t.string  "indication_of_end_user_exception"
    t.string  "execution_venue"
    t.float   "common_fixed_fair_rate"
    t.float   "end_date_fixed_fair_rate"
    t.float   "effective_date_fixed_fair_rate"
    t.string  "spread_delta"
    t.string  "fixed_delta"
  end

  create_table "metric_interestrate_option_swaption", primary_key: "dissemination_id", force: :cascade do |t|
    t.integer "execution_timestamp",              limit: 8
    t.string  "settlement_currency"
    t.integer "option_expiration_date",           limit: 8
    t.integer "effective_date",                   limit: 8
    t.integer "end_date",                         limit: 8
    t.integer "rounded_notional_amount_1",        limit: 8
    t.boolean "rounded_notional_overflow_flag_1"
    t.string  "option_type"
    t.float   "option_strike_price"
    t.string  "underlying_asset_1"
    t.string  "underlying_asset_2"
    t.string  "reset_frequency_1"
    t.string  "reset_frequency_2"
    t.string  "cleared"
    t.string  "indication_of_collateralization"
    t.string  "indication_of_end_user_exception"
    t.string  "execution_venue"
    t.string  "spread_delta"
    t.string  "fixed_delta"
    t.string  "vega_matrix"
    t.float   "volatility"
  end

  create_table "metrics", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "searches", force: :cascade do |t|
    t.string   "cleared",                          limit: 255
    t.string   "indication_of_collateralization",  limit: 255
    t.string   "indication_of_end_user_exception", limit: 255
    t.string   "execution_venue",                  limit: 255
    t.string   "effective_date",                   limit: 255
    t.string   "end_date",                         limit: 255
    t.string   "settlement_currency",              limit: 255
    t.string   "notional_currency_1",              limit: 255
    t.string   "notional_currency_2",              limit: 255
    t.string   "rounded_notional_amount_1",        limit: 255
    t.integer  "rounded_notional_amount_2"
    t.integer  "option_strike_price"
    t.string   "option_type",                      limit: 255
    t.string   "option_premium",                   limit: 255
    t.integer  "option_expiration_date"
    t.string   "floating_leg_reset",               limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                             limit: 255
    t.integer  "user_id"
    t.string   "taxonomy",                         limit: 255
  end

  add_index "searches", ["user_id"], name: "index_searches_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "views", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "views", ["user_id"], name: "index_views_on_user_id", using: :btree

end
