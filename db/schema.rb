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

ActiveRecord::Schema.define(version: 20190111183814) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.string "type", null: false
    t.string "postal_code", null: false
    t.string "prefecture", null: false
    t.string "city", null: false
    t.string "address1", null: false
    t.string "address2", null: false
    t.string "address3", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address1"], name: "index_addresses_on_address1"
    t.index ["city"], name: "index_addresses_on_city"
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
    t.index ["postal_code"], name: "index_addresses_on_postal_code"
    t.index ["prefecture", "city"], name: "index_addresses_on_prefecture_and_city"
    t.index ["type", "city"], name: "index_addresses_on_type_and_city"
    t.index ["type", "customer_id"], name: "index_addresses_on_type_and_customer_id", unique: true
    t.index ["type", "prefecture", "city"], name: "index_addresses_on_type_and_prefecture_and_city"
  end

  create_table "admin_events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "administrator_id", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.index ["administrator_id"], name: "index_admin_events_on_administrator_id"
    t.index ["created_at"], name: "index_admin_events_on_created_at"
  end

  create_table "administrators", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", null: false
    t.string "email_for_index", null: false
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.string "hashed_password"
    t.date "start_date", null: false
    t.date "end_date"
    t.boolean "suspended", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_for_index"], name: "index_administrators_on_email_for_index", unique: true
  end

  create_table "admissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "entries_year", default: "2018", null: false
    t.string "entries_month", default: "03", null: false
    t.string "entries_day", default: "10", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "allowed_sources", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "namespace", null: false
    t.integer "octet1", null: false
    t.integer "octet2", null: false
    t.integer "octet3", null: false
    t.integer "octet4", null: false
    t.boolean "wildcard", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["namespace", "octet1", "octet2", "octet3", "octet4"], name: "index_allowed_sources_on_namespace_and_octets", unique: true
  end

  create_table "banks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.string "bk_name", default: "", null: false
    t.string "office", default: "", null: false
    t.integer "account"
    t.string "bk_name_check", default: "", null: false
    t.string "office_check", default: "", null: false
    t.integer "account_check"
    t.string "web_registration", default: "未登録", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account"], name: "index_banks_on_account"
    t.index ["account_check"], name: "index_banks_on_account_check"
    t.index ["bk_name"], name: "index_banks_on_bk_name"
    t.index ["bk_name_check"], name: "index_banks_on_bk_name_check"
    t.index ["customer_id"], name: "index_banks_on_customer_id"
    t.index ["office"], name: "index_banks_on_office"
    t.index ["office_check"], name: "index_banks_on_office_check"
  end

  create_table "choices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "detection", default: 0, null: false
    t.string "remuneration", default: "キャッシュバック", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "commissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "pay_bank", null: false
    t.string "bank_name", default: "abc銀行", null: false
    t.integer "fee_low", default: 0, null: false
    t.integer "fee_high", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pay_bank"], name: "index_commissions_on_pay_bank", unique: true
  end

  create_table "customer_years", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.integer "year_check", default: 2018, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_years_on_customer_id"
    t.index ["year_check"], name: "index_customer_years_on_year_check"
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", null: false
    t.string "email_for_index", null: false
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.string "nickname", null: false
    t.string "gender"
    t.date "birthday"
    t.string "hashed_password"
    t.string "sponsor1", default: "sss", null: false
    t.string "member_type", default: "normal", null: false
    t.string "lock", default: "0", null: false
    t.string "bonus_lock", default: "0", null: false
    t.string "special_lock", default: "0", null: false
    t.integer "new_register", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "birth_year"
    t.integer "birth_month"
    t.integer "birth_mday"
    t.index ["birth_mday", "family_name_kana", "given_name_kana"], name: "index_customers_on_birth_mday_and_furigana"
    t.index ["birth_mday", "given_name_kana"], name: "index_customers_on_birth_mday_and_given_name_kana"
    t.index ["birth_mday"], name: "index_customers_on_birth_mday"
    t.index ["birth_month", "birth_mday"], name: "index_customers_on_birth_month_and_birth_mday"
    t.index ["birth_month", "family_name_kana", "given_name_kana"], name: "index_customers_on_birth_month_and_furigana"
    t.index ["birth_month", "given_name_kana"], name: "index_customers_on_birth_month_and_given_name_kana"
    t.index ["birth_year", "birth_month", "birth_mday"], name: "index_customers_on_birth_year_and_birth_month_and_birth_mday"
    t.index ["birth_year", "family_name_kana", "given_name_kana"], name: "index_customers_on_birth_year_and_furigana"
    t.index ["birth_year", "given_name_kana"], name: "index_customers_on_birth_year_and_given_name_kana"
    t.index ["created_at"], name: "index_customers_on_created_at"
    t.index ["email_for_index"], name: "index_customers_on_email_for_index", unique: true
    t.index ["family_name_kana", "given_name_kana"], name: "index_customers_on_family_name_kana_and_given_name_kana"
    t.index ["gender", "family_name_kana", "given_name_kana"], name: "index_customers_on_gender_and_furigana"
    t.index ["given_name_kana"], name: "index_customers_on_given_name_kana"
    t.index ["member_type"], name: "index_customers_on_member_type"
    t.index ["new_register"], name: "index_customers_on_new_register"
    t.index ["nickname"], name: "index_customers_on_nickname", unique: true
    t.index ["sponsor1"], name: "index_customers_on_sponsor1"
  end

  create_table "eighteen_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "om_1", default: 0, null: false
    t.integer "om_2", default: 0, null: false
    t.integer "om_3", default: 0, null: false
    t.integer "om_4", default: 0, null: false
    t.integer "om_5", default: 0, null: false
    t.integer "om_6", default: 0, null: false
    t.integer "om_7", default: 0, null: false
    t.integer "om_8", default: 0, null: false
    t.integer "om_9", default: 0, null: false
    t.integer "om_10", default: 0, null: false
    t.integer "om_11", default: 0, null: false
    t.integer "om_12", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eighteens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.integer "year", default: 2018, null: false
    t.integer "m_1", default: 0, null: false
    t.integer "m_2", default: 0, null: false
    t.integer "m_3", default: 0, null: false
    t.integer "c_1", default: 0, null: false
    t.integer "m_4", default: 0, null: false
    t.integer "m_5", default: 0, null: false
    t.integer "m_6", default: 0, null: false
    t.integer "c_2", default: 0, null: false
    t.integer "m_7", default: 0, null: false
    t.integer "m_8", default: 0, null: false
    t.integer "m_9", default: 0, null: false
    t.integer "c_3", default: 0, null: false
    t.integer "m_10", default: 0, null: false
    t.integer "m_11", default: 0, null: false
    t.integer "m_12", default: 0, null: false
    t.integer "c_4", default: 0, null: false
    t.integer "total", default: 0, null: false
    t.string "transfer_m_1", default: "未送金", null: false
    t.string "transfer_m_2", default: "未送金", null: false
    t.string "transfer_m_3", default: "未送金", null: false
    t.string "transfer_c_1", default: "未送金", null: false
    t.string "transfer_m_4", default: "未送金", null: false
    t.string "transfer_m_5", default: "未送金", null: false
    t.string "transfer_m_6", default: "未送金", null: false
    t.string "transfer_c_2", default: "未送金", null: false
    t.string "transfer_m_7", default: "未送金", null: false
    t.string "transfer_m_8", default: "未送金", null: false
    t.string "transfer_m_9", default: "未送金", null: false
    t.string "transfer_c_3", default: "未送金", null: false
    t.string "transfer_m_10", default: "未送金", null: false
    t.string "transfer_m_11", default: "未送金", null: false
    t.string "transfer_m_12", default: "未送金", null: false
    t.string "transfer_c_4", default: "未送金", null: false
    t.string "sp_transfer_1", default: "未送金", null: false
    t.string "sp_transfer_2", default: "未送金", null: false
    t.string "sp_transfer_3", default: "未送金", null: false
    t.string "sp_transfer_4", default: "未送金", null: false
    t.string "sp_transfer_5", default: "未送金", null: false
    t.string "sp_transfer_6", default: "未送金", null: false
    t.string "sp_transfer_7", default: "未送金", null: false
    t.string "sp_transfer_8", default: "未送金", null: false
    t.string "sp_transfer_9", default: "未送金", null: false
    t.string "sp_transfer_10", default: "未送金", null: false
    t.string "sp_transfer_11", default: "未送金", null: false
    t.string "sp_transfer_12", default: "未送金", null: false
    t.integer "pt_special_1", default: 0, null: false
    t.integer "pt_special_2", default: 0, null: false
    t.integer "pt_special_3", default: 0, null: false
    t.integer "pt_special_4", default: 0, null: false
    t.integer "pt_special_5", default: 0, null: false
    t.integer "pt_special_6", default: 0, null: false
    t.integer "pt_special_7", default: 0, null: false
    t.integer "pt_special_8", default: 0, null: false
    t.integer "pt_special_9", default: 0, null: false
    t.integer "pt_special_10", default: 0, null: false
    t.integer "pt_special_11", default: 0, null: false
    t.integer "pt_special_12", default: 0, null: false
    t.string "cache_payment_1", default: "未送金", null: false
    t.string "cache_payment_2", default: "未送金", null: false
    t.string "cache_payment_3", default: "未送金", null: false
    t.string "bonus_payment_1", default: "未送金", null: false
    t.string "cache_payment_4", default: "未送金", null: false
    t.string "cache_payment_5", default: "未送金", null: false
    t.string "cache_payment_6", default: "未送金", null: false
    t.string "bonus_payment_2", default: "未送金", null: false
    t.string "cache_payment_7", default: "未送金", null: false
    t.string "cache_payment_8", default: "未送金", null: false
    t.string "cache_payment_9", default: "未送金", null: false
    t.string "bonus_payment_3", default: "未送金", null: false
    t.string "cache_payment_10", default: "未送金", null: false
    t.string "cache_payment_11", default: "未送金", null: false
    t.string "cache_payment_12", default: "未送金", null: false
    t.string "bonus_payment_4", default: "未送金", null: false
    t.string "special_payment_1", default: "未送金", null: false
    t.string "special_payment_2", default: "未送金", null: false
    t.string "special_payment_3", default: "未送金", null: false
    t.string "special_payment_4", default: "未送金", null: false
    t.string "special_payment_5", default: "未送金", null: false
    t.string "special_payment_6", default: "未送金", null: false
    t.string "special_payment_7", default: "未送金", null: false
    t.string "special_payment_8", default: "未送金", null: false
    t.string "special_payment_9", default: "未送金", null: false
    t.string "special_payment_10", default: "未送金", null: false
    t.string "special_payment_11", default: "未送金", null: false
    t.string "special_payment_12", default: "未送金", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["c_1"], name: "index_eighteens_on_c_1"
    t.index ["c_2"], name: "index_eighteens_on_c_2"
    t.index ["c_3"], name: "index_eighteens_on_c_3"
    t.index ["c_4"], name: "index_eighteens_on_c_4"
    t.index ["customer_id"], name: "index_eighteens_on_customer_id"
    t.index ["m_1"], name: "index_eighteens_on_m_1"
    t.index ["m_10"], name: "index_eighteens_on_m_10"
    t.index ["m_11"], name: "index_eighteens_on_m_11"
    t.index ["m_12"], name: "index_eighteens_on_m_12"
    t.index ["m_2"], name: "index_eighteens_on_m_2"
    t.index ["m_3"], name: "index_eighteens_on_m_3"
    t.index ["m_4"], name: "index_eighteens_on_m_4"
    t.index ["m_5"], name: "index_eighteens_on_m_5"
    t.index ["m_6"], name: "index_eighteens_on_m_6"
    t.index ["m_7"], name: "index_eighteens_on_m_7"
    t.index ["m_8"], name: "index_eighteens_on_m_8"
    t.index ["m_9"], name: "index_eighteens_on_m_9"
    t.index ["pt_special_1"], name: "index_eighteens_on_pt_special_1"
    t.index ["pt_special_10"], name: "index_eighteens_on_pt_special_10"
    t.index ["pt_special_11"], name: "index_eighteens_on_pt_special_11"
    t.index ["pt_special_12"], name: "index_eighteens_on_pt_special_12"
    t.index ["pt_special_2"], name: "index_eighteens_on_pt_special_2"
    t.index ["pt_special_3"], name: "index_eighteens_on_pt_special_3"
    t.index ["pt_special_4"], name: "index_eighteens_on_pt_special_4"
    t.index ["pt_special_5"], name: "index_eighteens_on_pt_special_5"
    t.index ["pt_special_6"], name: "index_eighteens_on_pt_special_6"
    t.index ["pt_special_7"], name: "index_eighteens_on_pt_special_7"
    t.index ["pt_special_8"], name: "index_eighteens_on_pt_special_8"
    t.index ["pt_special_9"], name: "index_eighteens_on_pt_special_9"
  end

  create_table "entries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "program_id", null: false
    t.bigint "customer_id", null: false
    t.boolean "approved", default: false, null: false
    t.boolean "canceled", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_entries_on_customer_id"
    t.index ["program_id", "customer_id"], name: "index_entries_on_program_id_and_customer_id", unique: true
    t.index ["program_id"], name: "index_entries_on_program_id"
  end

  create_table "hash_locks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "table", null: false
    t.string "column", null: false
    t.string "key", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["table", "column", "key"], name: "index_hash_locks_on_table_and_column_and_key", unique: true
  end

  create_table "margins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "year", default: 2018, null: false
    t.integer "month", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.integer "mb_1", default: 0, null: false
    t.integer "mb_2", default: 0, null: false
    t.integer "mb_3", default: 0, null: false
    t.integer "mbc_1", default: 0, null: false
    t.integer "mb_4", default: 0, null: false
    t.integer "mb_5", default: 0, null: false
    t.integer "mb_6", default: 0, null: false
    t.integer "mbc_2", default: 0, null: false
    t.integer "mb_7", default: 0, null: false
    t.integer "mb_8", default: 0, null: false
    t.integer "mb_9", default: 0, null: false
    t.integer "mbc_3", default: 0, null: false
    t.integer "mb_10", default: 0, null: false
    t.integer "mb_11", default: 0, null: false
    t.integer "mb_12", default: 0, null: false
    t.integer "mbc_4", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_members_on_customer_id"
    t.index ["mb_1"], name: "index_members_on_mb_1"
    t.index ["mb_10"], name: "index_members_on_mb_10"
    t.index ["mb_11"], name: "index_members_on_mb_11"
    t.index ["mb_12"], name: "index_members_on_mb_12"
    t.index ["mb_2"], name: "index_members_on_mb_2"
    t.index ["mb_3"], name: "index_members_on_mb_3"
    t.index ["mb_4"], name: "index_members_on_mb_4"
    t.index ["mb_5"], name: "index_members_on_mb_5"
    t.index ["mb_6"], name: "index_members_on_mb_6"
    t.index ["mb_7"], name: "index_members_on_mb_7"
    t.index ["mb_8"], name: "index_members_on_mb_8"
    t.index ["mb_9"], name: "index_members_on_mb_9"
    t.index ["mbc_1"], name: "index_members_on_mbc_1"
    t.index ["mbc_2"], name: "index_members_on_mbc_2"
    t.index ["mbc_3"], name: "index_members_on_mbc_3"
    t.index ["mbc_4"], name: "index_members_on_mbc_4"
  end

  create_table "message_tag_links", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "message_id", null: false
    t.bigint "tag_id", null: false
    t.index ["message_id", "tag_id"], name: "index_message_tag_links_on_message_id_and_tag_id", unique: true
    t.index ["message_id"], name: "index_message_tag_links_on_message_id"
    t.index ["tag_id"], name: "index_message_tag_links_on_tag_id"
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.bigint "staff_member_id"
    t.bigint "root_id"
    t.bigint "parent_id"
    t.string "type", null: false
    t.string "status", default: "new", null: false
    t.string "subject", null: false
    t.text "body"
    t.text "remarks"
    t.boolean "discarded", default: false, null: false
    t.boolean "deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id", "deleted", "created_at"], name: "index_messages_on_customer_id_and_deleted_and_created_at"
    t.index ["customer_id", "deleted", "status", "created_at"], name: "index_messages_on_c_d_s_c"
    t.index ["customer_id", "discarded", "created_at"], name: "index_messages_on_customer_id_and_discarded_and_created_at"
    t.index ["customer_id"], name: "index_messages_on_customer_id"
    t.index ["parent_id"], name: "fk_rails_aafcb31dbf"
    t.index ["root_id", "deleted", "created_at"], name: "index_messages_on_root_id_and_deleted_and_created_at"
    t.index ["staff_member_id"], name: "index_messages_on_staff_member_id"
    t.index ["type", "customer_id"], name: "index_messages_on_type_and_customer_id"
    t.index ["type", "staff_member_id"], name: "index_messages_on_type_and_staff_member_id"
  end

  create_table "nineteen_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "om_1", default: 0, null: false
    t.integer "om_2", default: 0, null: false
    t.integer "om_3", default: 0, null: false
    t.integer "om_4", default: 0, null: false
    t.integer "om_5", default: 0, null: false
    t.integer "om_6", default: 0, null: false
    t.integer "om_7", default: 0, null: false
    t.integer "om_8", default: 0, null: false
    t.integer "om_9", default: 0, null: false
    t.integer "om_10", default: 0, null: false
    t.integer "om_11", default: 0, null: false
    t.integer "om_12", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nineteens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.integer "year", default: 2019, null: false
    t.integer "m_1", default: 0, null: false
    t.integer "m_2", default: 0, null: false
    t.integer "m_3", default: 0, null: false
    t.integer "c_1", default: 0, null: false
    t.integer "m_4", default: 0, null: false
    t.integer "m_5", default: 0, null: false
    t.integer "m_6", default: 0, null: false
    t.integer "c_2", default: 0, null: false
    t.integer "m_7", default: 0, null: false
    t.integer "m_8", default: 0, null: false
    t.integer "m_9", default: 0, null: false
    t.integer "c_3", default: 0, null: false
    t.integer "m_10", default: 0, null: false
    t.integer "m_11", default: 0, null: false
    t.integer "m_12", default: 0, null: false
    t.integer "c_4", default: 0, null: false
    t.integer "total", default: 0, null: false
    t.string "transfer_m_1", default: "未送金", null: false
    t.string "transfer_m_2", default: "未送金", null: false
    t.string "transfer_m_3", default: "未送金", null: false
    t.string "transfer_c_1", default: "未送金", null: false
    t.string "transfer_m_4", default: "未送金", null: false
    t.string "transfer_m_5", default: "未送金", null: false
    t.string "transfer_m_6", default: "未送金", null: false
    t.string "transfer_c_2", default: "未送金", null: false
    t.string "transfer_m_7", default: "未送金", null: false
    t.string "transfer_m_8", default: "未送金", null: false
    t.string "transfer_m_9", default: "未送金", null: false
    t.string "transfer_c_3", default: "未送金", null: false
    t.string "transfer_m_10", default: "未送金", null: false
    t.string "transfer_m_11", default: "未送金", null: false
    t.string "transfer_m_12", default: "未送金", null: false
    t.string "transfer_c_4", default: "未送金", null: false
    t.string "sp_transfer_1", default: "未送金", null: false
    t.string "sp_transfer_2", default: "未送金", null: false
    t.string "sp_transfer_3", default: "未送金", null: false
    t.string "sp_transfer_4", default: "未送金", null: false
    t.string "sp_transfer_5", default: "未送金", null: false
    t.string "sp_transfer_6", default: "未送金", null: false
    t.string "sp_transfer_7", default: "未送金", null: false
    t.string "sp_transfer_8", default: "未送金", null: false
    t.string "sp_transfer_9", default: "未送金", null: false
    t.string "sp_transfer_10", default: "未送金", null: false
    t.string "sp_transfer_11", default: "未送金", null: false
    t.string "sp_transfer_12", default: "未送金", null: false
    t.integer "pt_special_1", default: 0, null: false
    t.integer "pt_special_2", default: 0, null: false
    t.integer "pt_special_3", default: 0, null: false
    t.integer "pt_special_4", default: 0, null: false
    t.integer "pt_special_5", default: 0, null: false
    t.integer "pt_special_6", default: 0, null: false
    t.integer "pt_special_7", default: 0, null: false
    t.integer "pt_special_8", default: 0, null: false
    t.integer "pt_special_9", default: 0, null: false
    t.integer "pt_special_10", default: 0, null: false
    t.integer "pt_special_11", default: 0, null: false
    t.integer "pt_special_12", default: 0, null: false
    t.string "cache_payment_1", default: "未送金", null: false
    t.string "cache_payment_2", default: "未送金", null: false
    t.string "cache_payment_3", default: "未送金", null: false
    t.string "bonus_payment_1", default: "未送金", null: false
    t.string "cache_payment_4", default: "未送金", null: false
    t.string "cache_payment_5", default: "未送金", null: false
    t.string "cache_payment_6", default: "未送金", null: false
    t.string "bonus_payment_2", default: "未送金", null: false
    t.string "cache_payment_7", default: "未送金", null: false
    t.string "cache_payment_8", default: "未送金", null: false
    t.string "cache_payment_9", default: "未送金", null: false
    t.string "bonus_payment_3", default: "未送金", null: false
    t.string "cache_payment_10", default: "未送金", null: false
    t.string "cache_payment_11", default: "未送金", null: false
    t.string "cache_payment_12", default: "未送金", null: false
    t.string "bonus_payment_4", default: "未送金", null: false
    t.string "special_payment_1", default: "未送金", null: false
    t.string "special_payment_2", default: "未送金", null: false
    t.string "special_payment_3", default: "未送金", null: false
    t.string "special_payment_4", default: "未送金", null: false
    t.string "special_payment_5", default: "未送金", null: false
    t.string "special_payment_6", default: "未送金", null: false
    t.string "special_payment_7", default: "未送金", null: false
    t.string "special_payment_8", default: "未送金", null: false
    t.string "special_payment_9", default: "未送金", null: false
    t.string "special_payment_10", default: "未送金", null: false
    t.string "special_payment_11", default: "未送金", null: false
    t.string "special_payment_12", default: "未送金", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["c_1"], name: "index_nineteens_on_c_1"
    t.index ["c_2"], name: "index_nineteens_on_c_2"
    t.index ["c_3"], name: "index_nineteens_on_c_3"
    t.index ["c_4"], name: "index_nineteens_on_c_4"
    t.index ["customer_id"], name: "index_nineteens_on_customer_id"
    t.index ["m_1"], name: "index_nineteens_on_m_1"
    t.index ["m_10"], name: "index_nineteens_on_m_10"
    t.index ["m_11"], name: "index_nineteens_on_m_11"
    t.index ["m_12"], name: "index_nineteens_on_m_12"
    t.index ["m_2"], name: "index_nineteens_on_m_2"
    t.index ["m_3"], name: "index_nineteens_on_m_3"
    t.index ["m_4"], name: "index_nineteens_on_m_4"
    t.index ["m_5"], name: "index_nineteens_on_m_5"
    t.index ["m_6"], name: "index_nineteens_on_m_6"
    t.index ["m_7"], name: "index_nineteens_on_m_7"
    t.index ["m_8"], name: "index_nineteens_on_m_8"
    t.index ["m_9"], name: "index_nineteens_on_m_9"
    t.index ["pt_special_1"], name: "index_nineteens_on_pt_special_1"
    t.index ["pt_special_10"], name: "index_nineteens_on_pt_special_10"
    t.index ["pt_special_11"], name: "index_nineteens_on_pt_special_11"
    t.index ["pt_special_12"], name: "index_nineteens_on_pt_special_12"
    t.index ["pt_special_2"], name: "index_nineteens_on_pt_special_2"
    t.index ["pt_special_3"], name: "index_nineteens_on_pt_special_3"
    t.index ["pt_special_4"], name: "index_nineteens_on_pt_special_4"
    t.index ["pt_special_5"], name: "index_nineteens_on_pt_special_5"
    t.index ["pt_special_6"], name: "index_nineteens_on_pt_special_6"
    t.index ["pt_special_7"], name: "index_nineteens_on_pt_special_7"
    t.index ["pt_special_8"], name: "index_nineteens_on_pt_special_8"
    t.index ["pt_special_9"], name: "index_nineteens_on_pt_special_9"
  end

  create_table "numbers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "entries_month", default: "01", null: false
    t.string "entries_week", default: "1", null: false
    t.string "entries_day", default: "1", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "one_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "om_1", default: 0, null: false
    t.integer "om_2", default: 0, null: false
    t.integer "om_3", default: 0, null: false
    t.integer "om_4", default: 0, null: false
    t.integer "om_5", default: 0, null: false
    t.integer "om_6", default: 0, null: false
    t.integer "om_7", default: 0, null: false
    t.integer "om_8", default: 0, null: false
    t.integer "om_9", default: 0, null: false
    t.integer "om_10", default: 0, null: false
    t.integer "om_11", default: 0, null: false
    t.integer "om_12", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.integer "year", default: 2021, null: false
    t.integer "m_1", default: 0, null: false
    t.integer "m_2", default: 0, null: false
    t.integer "m_3", default: 0, null: false
    t.integer "c_1", default: 0, null: false
    t.integer "m_4", default: 0, null: false
    t.integer "m_5", default: 0, null: false
    t.integer "m_6", default: 0, null: false
    t.integer "c_2", default: 0, null: false
    t.integer "m_7", default: 0, null: false
    t.integer "m_8", default: 0, null: false
    t.integer "m_9", default: 0, null: false
    t.integer "c_3", default: 0, null: false
    t.integer "m_10", default: 0, null: false
    t.integer "m_11", default: 0, null: false
    t.integer "m_12", default: 0, null: false
    t.integer "c_4", default: 0, null: false
    t.integer "total", default: 0, null: false
    t.string "transfer_m_1", default: "未送金", null: false
    t.string "transfer_m_2", default: "未送金", null: false
    t.string "transfer_m_3", default: "未送金", null: false
    t.string "transfer_c_1", default: "未送金", null: false
    t.string "transfer_m_4", default: "未送金", null: false
    t.string "transfer_m_5", default: "未送金", null: false
    t.string "transfer_m_6", default: "未送金", null: false
    t.string "transfer_c_2", default: "未送金", null: false
    t.string "transfer_m_7", default: "未送金", null: false
    t.string "transfer_m_8", default: "未送金", null: false
    t.string "transfer_m_9", default: "未送金", null: false
    t.string "transfer_c_3", default: "未送金", null: false
    t.string "transfer_m_10", default: "未送金", null: false
    t.string "transfer_m_11", default: "未送金", null: false
    t.string "transfer_m_12", default: "未送金", null: false
    t.string "transfer_c_4", default: "未送金", null: false
    t.string "sp_transfer_1", default: "未送金", null: false
    t.string "sp_transfer_2", default: "未送金", null: false
    t.string "sp_transfer_3", default: "未送金", null: false
    t.string "sp_transfer_4", default: "未送金", null: false
    t.string "sp_transfer_5", default: "未送金", null: false
    t.string "sp_transfer_6", default: "未送金", null: false
    t.string "sp_transfer_7", default: "未送金", null: false
    t.string "sp_transfer_8", default: "未送金", null: false
    t.string "sp_transfer_9", default: "未送金", null: false
    t.string "sp_transfer_10", default: "未送金", null: false
    t.string "sp_transfer_11", default: "未送金", null: false
    t.string "sp_transfer_12", default: "未送金", null: false
    t.integer "pt_special_1", default: 0, null: false
    t.integer "pt_special_2", default: 0, null: false
    t.integer "pt_special_3", default: 0, null: false
    t.integer "pt_special_4", default: 0, null: false
    t.integer "pt_special_5", default: 0, null: false
    t.integer "pt_special_6", default: 0, null: false
    t.integer "pt_special_7", default: 0, null: false
    t.integer "pt_special_8", default: 0, null: false
    t.integer "pt_special_9", default: 0, null: false
    t.integer "pt_special_10", default: 0, null: false
    t.integer "pt_special_11", default: 0, null: false
    t.integer "pt_special_12", default: 0, null: false
    t.string "cache_payment_1", default: "未送金", null: false
    t.string "cache_payment_2", default: "未送金", null: false
    t.string "cache_payment_3", default: "未送金", null: false
    t.string "bonus_payment_1", default: "未送金", null: false
    t.string "cache_payment_4", default: "未送金", null: false
    t.string "cache_payment_5", default: "未送金", null: false
    t.string "cache_payment_6", default: "未送金", null: false
    t.string "bonus_payment_2", default: "未送金", null: false
    t.string "cache_payment_7", default: "未送金", null: false
    t.string "cache_payment_8", default: "未送金", null: false
    t.string "cache_payment_9", default: "未送金", null: false
    t.string "bonus_payment_3", default: "未送金", null: false
    t.string "cache_payment_10", default: "未送金", null: false
    t.string "cache_payment_11", default: "未送金", null: false
    t.string "cache_payment_12", default: "未送金", null: false
    t.string "bonus_payment_4", default: "未送金", null: false
    t.string "special_payment_1", default: "未送金", null: false
    t.string "special_payment_2", default: "未送金", null: false
    t.string "special_payment_3", default: "未送金", null: false
    t.string "special_payment_4", default: "未送金", null: false
    t.string "special_payment_5", default: "未送金", null: false
    t.string "special_payment_6", default: "未送金", null: false
    t.string "special_payment_7", default: "未送金", null: false
    t.string "special_payment_8", default: "未送金", null: false
    t.string "special_payment_9", default: "未送金", null: false
    t.string "special_payment_10", default: "未送金", null: false
    t.string "special_payment_11", default: "未送金", null: false
    t.string "special_payment_12", default: "未送金", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["c_1"], name: "index_ones_on_c_1"
    t.index ["c_2"], name: "index_ones_on_c_2"
    t.index ["c_3"], name: "index_ones_on_c_3"
    t.index ["c_4"], name: "index_ones_on_c_4"
    t.index ["customer_id"], name: "index_ones_on_customer_id"
    t.index ["m_1"], name: "index_ones_on_m_1"
    t.index ["m_10"], name: "index_ones_on_m_10"
    t.index ["m_11"], name: "index_ones_on_m_11"
    t.index ["m_12"], name: "index_ones_on_m_12"
    t.index ["m_2"], name: "index_ones_on_m_2"
    t.index ["m_3"], name: "index_ones_on_m_3"
    t.index ["m_4"], name: "index_ones_on_m_4"
    t.index ["m_5"], name: "index_ones_on_m_5"
    t.index ["m_6"], name: "index_ones_on_m_6"
    t.index ["m_7"], name: "index_ones_on_m_7"
    t.index ["m_8"], name: "index_ones_on_m_8"
    t.index ["m_9"], name: "index_ones_on_m_9"
    t.index ["pt_special_1"], name: "index_ones_on_pt_special_1"
    t.index ["pt_special_10"], name: "index_ones_on_pt_special_10"
    t.index ["pt_special_11"], name: "index_ones_on_pt_special_11"
    t.index ["pt_special_12"], name: "index_ones_on_pt_special_12"
    t.index ["pt_special_2"], name: "index_ones_on_pt_special_2"
    t.index ["pt_special_3"], name: "index_ones_on_pt_special_3"
    t.index ["pt_special_4"], name: "index_ones_on_pt_special_4"
    t.index ["pt_special_5"], name: "index_ones_on_pt_special_5"
    t.index ["pt_special_6"], name: "index_ones_on_pt_special_6"
    t.index ["pt_special_7"], name: "index_ones_on_pt_special_7"
    t.index ["pt_special_8"], name: "index_ones_on_pt_special_8"
    t.index ["pt_special_9"], name: "index_ones_on_pt_special_9"
  end

  create_table "pays", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "year", default: 2018, null: false
    t.integer "month", default: 1, null: false
    t.integer "quarter", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.bigint "address_id"
    t.string "number", default: "0", null: false
    t.string "number_for_index", null: false
    t.boolean "primary", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_four_digits"
    t.index ["address_id"], name: "index_phones_on_address_id"
    t.index ["customer_id"], name: "index_phones_on_customer_id"
    t.index ["last_four_digits"], name: "index_phones_on_last_four_digits"
    t.index ["number_for_index"], name: "index_phones_on_number_for_index"
  end

  create_table "points", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.integer "bns_1", default: 0, null: false
    t.integer "bns_2", default: 0, null: false
    t.integer "bns_3", default: 0, null: false
    t.integer "cbns_1", default: 0, null: false
    t.integer "bns_4", default: 0, null: false
    t.integer "bns_5", default: 0, null: false
    t.integer "bns_6", default: 0, null: false
    t.integer "cbns_2", default: 0, null: false
    t.integer "bns_7", default: 0, null: false
    t.integer "bns_8", default: 0, null: false
    t.integer "bns_9", default: 0, null: false
    t.integer "cbns_3", default: 0, null: false
    t.integer "bns_10", default: 0, null: false
    t.integer "bns_11", default: 0, null: false
    t.integer "bns_12", default: 0, null: false
    t.integer "cbns_4", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bns_1"], name: "index_points_on_bns_1"
    t.index ["bns_10"], name: "index_points_on_bns_10"
    t.index ["bns_11"], name: "index_points_on_bns_11"
    t.index ["bns_12"], name: "index_points_on_bns_12"
    t.index ["bns_2"], name: "index_points_on_bns_2"
    t.index ["bns_3"], name: "index_points_on_bns_3"
    t.index ["bns_4"], name: "index_points_on_bns_4"
    t.index ["bns_5"], name: "index_points_on_bns_5"
    t.index ["bns_6"], name: "index_points_on_bns_6"
    t.index ["bns_7"], name: "index_points_on_bns_7"
    t.index ["bns_8"], name: "index_points_on_bns_8"
    t.index ["bns_9"], name: "index_points_on_bns_9"
    t.index ["cbns_1"], name: "index_points_on_cbns_1"
    t.index ["cbns_2"], name: "index_points_on_cbns_2"
    t.index ["cbns_3"], name: "index_points_on_cbns_3"
    t.index ["cbns_4"], name: "index_points_on_cbns_4"
    t.index ["customer_id"], name: "index_points_on_customer_id"
  end

  create_table "programs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "registrant_id", null: false
    t.string "title", null: false
    t.text "description"
    t.datetime "application_start_time", null: false
    t.datetime "application_end_time", null: false
    t.integer "min_number_of_participants"
    t.integer "max_number_of_participants"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_start_time"], name: "index_programs_on_application_start_time"
    t.index ["registrant_id"], name: "index_programs_on_registrant_id"
  end

  create_table "registers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.string "rg_1", default: "退会", null: false
    t.string "rg_2", default: "退会", null: false
    t.string "rg_3", default: "退会", null: false
    t.string "rg_4", default: "退会", null: false
    t.string "rg_5", default: "退会", null: false
    t.string "rg_6", default: "退会", null: false
    t.string "rg_7", default: "退会", null: false
    t.string "rg_8", default: "退会", null: false
    t.string "rg_9", default: "退会", null: false
    t.string "rg_10", default: "退会", null: false
    t.string "rg_11", default: "退会", null: false
    t.string "rg_12", default: "退会", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_registers_on_customer_id"
    t.index ["rg_1"], name: "index_registers_on_rg_1"
    t.index ["rg_10"], name: "index_registers_on_rg_10"
    t.index ["rg_11"], name: "index_registers_on_rg_11"
    t.index ["rg_12"], name: "index_registers_on_rg_12"
    t.index ["rg_2"], name: "index_registers_on_rg_2"
    t.index ["rg_3"], name: "index_registers_on_rg_3"
    t.index ["rg_4"], name: "index_registers_on_rg_4"
    t.index ["rg_5"], name: "index_registers_on_rg_5"
    t.index ["rg_6"], name: "index_registers_on_rg_6"
    t.index ["rg_7"], name: "index_registers_on_rg_7"
    t.index ["rg_8"], name: "index_registers_on_rg_8"
    t.index ["rg_9"], name: "index_registers_on_rg_9"
  end

  create_table "retrievals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "year", default: 2018, null: false
    t.integer "month", default: 1, null: false
    t.string "item", default: "企業実績", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.integer "sc_1", default: 0, null: false
    t.integer "sc_2", default: 0, null: false
    t.integer "sc_3", default: 0, null: false
    t.integer "scc_1", default: 0, null: false
    t.integer "sc_4", default: 0, null: false
    t.integer "sc_5", default: 0, null: false
    t.integer "sc_6", default: 0, null: false
    t.integer "scc_2", default: 0, null: false
    t.integer "sc_7", default: 0, null: false
    t.integer "sc_8", default: 0, null: false
    t.integer "sc_9", default: 0, null: false
    t.integer "scc_3", default: 0, null: false
    t.integer "sc_10", default: 0, null: false
    t.integer "sc_11", default: 0, null: false
    t.integer "sc_12", default: 0, null: false
    t.integer "scc_4", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_scores_on_customer_id"
    t.index ["sc_1"], name: "index_scores_on_sc_1"
    t.index ["sc_10"], name: "index_scores_on_sc_10"
    t.index ["sc_11"], name: "index_scores_on_sc_11"
    t.index ["sc_12"], name: "index_scores_on_sc_12"
    t.index ["sc_2"], name: "index_scores_on_sc_2"
    t.index ["sc_3"], name: "index_scores_on_sc_3"
    t.index ["sc_4"], name: "index_scores_on_sc_4"
    t.index ["sc_5"], name: "index_scores_on_sc_5"
    t.index ["sc_6"], name: "index_scores_on_sc_6"
    t.index ["sc_7"], name: "index_scores_on_sc_7"
    t.index ["sc_8"], name: "index_scores_on_sc_8"
    t.index ["sc_9"], name: "index_scores_on_sc_9"
    t.index ["scc_1"], name: "index_scores_on_scc_1"
    t.index ["scc_2"], name: "index_scores_on_scc_2"
    t.index ["scc_3"], name: "index_scores_on_scc_3"
    t.index ["scc_4"], name: "index_scores_on_scc_4"
  end

  create_table "seventeens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.integer "year", default: 2017, null: false
    t.integer "m_1", default: 0, null: false
    t.integer "m_2", default: 0, null: false
    t.integer "m_3", default: 0, null: false
    t.integer "c_1", default: 0, null: false
    t.integer "m_4", default: 0, null: false
    t.integer "m_5", default: 0, null: false
    t.integer "m_6", default: 0, null: false
    t.integer "c_2", default: 0, null: false
    t.integer "m_7", default: 0, null: false
    t.integer "m_8", default: 0, null: false
    t.integer "m_9", default: 0, null: false
    t.integer "c_3", default: 0, null: false
    t.integer "m_10", default: 0, null: false
    t.integer "m_11", default: 0, null: false
    t.integer "m_12", default: 0, null: false
    t.integer "c_4", default: 0, null: false
    t.integer "total", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["c_1"], name: "index_seventeens_on_c_1"
    t.index ["c_2"], name: "index_seventeens_on_c_2"
    t.index ["c_3"], name: "index_seventeens_on_c_3"
    t.index ["c_4"], name: "index_seventeens_on_c_4"
    t.index ["customer_id"], name: "index_seventeens_on_customer_id"
    t.index ["m_1"], name: "index_seventeens_on_m_1"
    t.index ["m_10"], name: "index_seventeens_on_m_10"
    t.index ["m_11"], name: "index_seventeens_on_m_11"
    t.index ["m_12"], name: "index_seventeens_on_m_12"
    t.index ["m_2"], name: "index_seventeens_on_m_2"
    t.index ["m_3"], name: "index_seventeens_on_m_3"
    t.index ["m_4"], name: "index_seventeens_on_m_4"
    t.index ["m_5"], name: "index_seventeens_on_m_5"
    t.index ["m_6"], name: "index_seventeens_on_m_6"
    t.index ["m_7"], name: "index_seventeens_on_m_7"
    t.index ["m_8"], name: "index_seventeens_on_m_8"
    t.index ["m_9"], name: "index_seventeens_on_m_9"
  end

  create_table "specials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.integer "basic", default: 0, null: false
    t.integer "crystal", default: 0, null: false
    t.integer "silver", default: 0, null: false
    t.integer "gold", default: 0, null: false
    t.integer "platinum", default: 0, null: false
    t.integer "pegasus", default: 0, null: false
    t.integer "phoenix", default: 0, null: false
    t.integer "queen", default: 0, null: false
    t.integer "king", default: 0, null: false
    t.integer "president", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["basic"], name: "index_specials_on_basic"
    t.index ["crystal"], name: "index_specials_on_crystal"
    t.index ["customer_id"], name: "index_specials_on_customer_id"
    t.index ["gold"], name: "index_specials_on_gold"
    t.index ["king"], name: "index_specials_on_king"
    t.index ["pegasus"], name: "index_specials_on_pegasus"
    t.index ["phoenix"], name: "index_specials_on_phoenix"
    t.index ["platinum"], name: "index_specials_on_platinum"
    t.index ["president"], name: "index_specials_on_president"
    t.index ["queen"], name: "index_specials_on_queen"
    t.index ["silver"], name: "index_specials_on_silver"
  end

  create_table "sponsors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.string "sponsor1", default: "dragon", null: false
    t.string "sponsor2", default: "dragon", null: false
    t.string "sponsor3", default: "dragon", null: false
    t.string "sponsor4", default: "dragon", null: false
    t.string "sponsor5", default: "dragon", null: false
    t.string "sponsor6", default: "dragon", null: false
    t.string "sponsor7", default: "dragon", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_sponsors_on_customer_id"
    t.index ["sponsor1"], name: "index_sponsors_on_sponsor1"
    t.index ["sponsor2"], name: "index_sponsors_on_sponsor2"
    t.index ["sponsor3"], name: "index_sponsors_on_sponsor3"
    t.index ["sponsor4"], name: "index_sponsors_on_sponsor4"
    t.index ["sponsor5"], name: "index_sponsors_on_sponsor5"
    t.index ["sponsor6"], name: "index_sponsors_on_sponsor6"
    t.index ["sponsor7"], name: "index_sponsors_on_sponsor7"
  end

  create_table "staff_events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "staff_member_id", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.index ["created_at"], name: "index_staff_events_on_created_at"
    t.index ["staff_member_id"], name: "index_staff_events_on_staff_member_id"
  end

  create_table "staff_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", null: false
    t.string "email_for_index", null: false
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.string "hashed_password"
    t.date "start_date", null: false
    t.date "end_date"
    t.boolean "suspended", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_for_index"], name: "index_staff_members_on_email_for_index", unique: true
    t.index ["family_name_kana", "given_name_kana"], name: "index_staff_members_on_family_name_kana_and_given_name_kana"
  end

  create_table "staff_months", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "retrieval_year", default: "2018", null: false
    t.string "retrieval_month", default: "03", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staff_quarters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "bonus_year", default: "2018", null: false
    t.string "bonus_quarter", default: "1", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staff_years", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "year_check", default: 2018, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "value", null: false
    t.index ["value"], name: "index_tags_on_value", unique: true
  end

  create_table "twentie_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "om_1", default: 0, null: false
    t.integer "om_2", default: 0, null: false
    t.integer "om_3", default: 0, null: false
    t.integer "om_4", default: 0, null: false
    t.integer "om_5", default: 0, null: false
    t.integer "om_6", default: 0, null: false
    t.integer "om_7", default: 0, null: false
    t.integer "om_8", default: 0, null: false
    t.integer "om_9", default: 0, null: false
    t.integer "om_10", default: 0, null: false
    t.integer "om_11", default: 0, null: false
    t.integer "om_12", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "twenties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.integer "year", default: 2020, null: false
    t.integer "m_1", default: 0, null: false
    t.integer "m_2", default: 0, null: false
    t.integer "m_3", default: 0, null: false
    t.integer "c_1", default: 0, null: false
    t.integer "m_4", default: 0, null: false
    t.integer "m_5", default: 0, null: false
    t.integer "m_6", default: 0, null: false
    t.integer "c_2", default: 0, null: false
    t.integer "m_7", default: 0, null: false
    t.integer "m_8", default: 0, null: false
    t.integer "m_9", default: 0, null: false
    t.integer "c_3", default: 0, null: false
    t.integer "m_10", default: 0, null: false
    t.integer "m_11", default: 0, null: false
    t.integer "m_12", default: 0, null: false
    t.integer "c_4", default: 0, null: false
    t.integer "total", default: 0, null: false
    t.string "transfer_m_1", default: "未送金", null: false
    t.string "transfer_m_2", default: "未送金", null: false
    t.string "transfer_m_3", default: "未送金", null: false
    t.string "transfer_c_1", default: "未送金", null: false
    t.string "transfer_m_4", default: "未送金", null: false
    t.string "transfer_m_5", default: "未送金", null: false
    t.string "transfer_m_6", default: "未送金", null: false
    t.string "transfer_c_2", default: "未送金", null: false
    t.string "transfer_m_7", default: "未送金", null: false
    t.string "transfer_m_8", default: "未送金", null: false
    t.string "transfer_m_9", default: "未送金", null: false
    t.string "transfer_c_3", default: "未送金", null: false
    t.string "transfer_m_10", default: "未送金", null: false
    t.string "transfer_m_11", default: "未送金", null: false
    t.string "transfer_m_12", default: "未送金", null: false
    t.string "transfer_c_4", default: "未送金", null: false
    t.string "sp_transfer_1", default: "未送金", null: false
    t.string "sp_transfer_2", default: "未送金", null: false
    t.string "sp_transfer_3", default: "未送金", null: false
    t.string "sp_transfer_4", default: "未送金", null: false
    t.string "sp_transfer_5", default: "未送金", null: false
    t.string "sp_transfer_6", default: "未送金", null: false
    t.string "sp_transfer_7", default: "未送金", null: false
    t.string "sp_transfer_8", default: "未送金", null: false
    t.string "sp_transfer_9", default: "未送金", null: false
    t.string "sp_transfer_10", default: "未送金", null: false
    t.string "sp_transfer_11", default: "未送金", null: false
    t.string "sp_transfer_12", default: "未送金", null: false
    t.integer "pt_special_1", default: 0, null: false
    t.integer "pt_special_2", default: 0, null: false
    t.integer "pt_special_3", default: 0, null: false
    t.integer "pt_special_4", default: 0, null: false
    t.integer "pt_special_5", default: 0, null: false
    t.integer "pt_special_6", default: 0, null: false
    t.integer "pt_special_7", default: 0, null: false
    t.integer "pt_special_8", default: 0, null: false
    t.integer "pt_special_9", default: 0, null: false
    t.integer "pt_special_10", default: 0, null: false
    t.integer "pt_special_11", default: 0, null: false
    t.integer "pt_special_12", default: 0, null: false
    t.string "cache_payment_1", default: "未送金", null: false
    t.string "cache_payment_2", default: "未送金", null: false
    t.string "cache_payment_3", default: "未送金", null: false
    t.string "bonus_payment_1", default: "未送金", null: false
    t.string "cache_payment_4", default: "未送金", null: false
    t.string "cache_payment_5", default: "未送金", null: false
    t.string "cache_payment_6", default: "未送金", null: false
    t.string "bonus_payment_2", default: "未送金", null: false
    t.string "cache_payment_7", default: "未送金", null: false
    t.string "cache_payment_8", default: "未送金", null: false
    t.string "cache_payment_9", default: "未送金", null: false
    t.string "bonus_payment_3", default: "未送金", null: false
    t.string "cache_payment_10", default: "未送金", null: false
    t.string "cache_payment_11", default: "未送金", null: false
    t.string "cache_payment_12", default: "未送金", null: false
    t.string "bonus_payment_4", default: "未送金", null: false
    t.string "special_payment_1", default: "未送金", null: false
    t.string "special_payment_2", default: "未送金", null: false
    t.string "special_payment_3", default: "未送金", null: false
    t.string "special_payment_4", default: "未送金", null: false
    t.string "special_payment_5", default: "未送金", null: false
    t.string "special_payment_6", default: "未送金", null: false
    t.string "special_payment_7", default: "未送金", null: false
    t.string "special_payment_8", default: "未送金", null: false
    t.string "special_payment_9", default: "未送金", null: false
    t.string "special_payment_10", default: "未送金", null: false
    t.string "special_payment_11", default: "未送金", null: false
    t.string "special_payment_12", default: "未送金", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["c_1"], name: "index_twenties_on_c_1"
    t.index ["c_2"], name: "index_twenties_on_c_2"
    t.index ["c_3"], name: "index_twenties_on_c_3"
    t.index ["c_4"], name: "index_twenties_on_c_4"
    t.index ["customer_id"], name: "index_twenties_on_customer_id"
    t.index ["m_1"], name: "index_twenties_on_m_1"
    t.index ["m_10"], name: "index_twenties_on_m_10"
    t.index ["m_11"], name: "index_twenties_on_m_11"
    t.index ["m_12"], name: "index_twenties_on_m_12"
    t.index ["m_2"], name: "index_twenties_on_m_2"
    t.index ["m_3"], name: "index_twenties_on_m_3"
    t.index ["m_4"], name: "index_twenties_on_m_4"
    t.index ["m_5"], name: "index_twenties_on_m_5"
    t.index ["m_6"], name: "index_twenties_on_m_6"
    t.index ["m_7"], name: "index_twenties_on_m_7"
    t.index ["m_8"], name: "index_twenties_on_m_8"
    t.index ["m_9"], name: "index_twenties_on_m_9"
    t.index ["pt_special_1"], name: "index_twenties_on_pt_special_1"
    t.index ["pt_special_10"], name: "index_twenties_on_pt_special_10"
    t.index ["pt_special_11"], name: "index_twenties_on_pt_special_11"
    t.index ["pt_special_12"], name: "index_twenties_on_pt_special_12"
    t.index ["pt_special_2"], name: "index_twenties_on_pt_special_2"
    t.index ["pt_special_3"], name: "index_twenties_on_pt_special_3"
    t.index ["pt_special_4"], name: "index_twenties_on_pt_special_4"
    t.index ["pt_special_5"], name: "index_twenties_on_pt_special_5"
    t.index ["pt_special_6"], name: "index_twenties_on_pt_special_6"
    t.index ["pt_special_7"], name: "index_twenties_on_pt_special_7"
    t.index ["pt_special_8"], name: "index_twenties_on_pt_special_8"
    t.index ["pt_special_9"], name: "index_twenties_on_pt_special_9"
  end

  create_table "twenty_five_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "om_1", default: 0, null: false
    t.integer "om_2", default: 0, null: false
    t.integer "om_3", default: 0, null: false
    t.integer "om_4", default: 0, null: false
    t.integer "om_5", default: 0, null: false
    t.integer "om_6", default: 0, null: false
    t.integer "om_7", default: 0, null: false
    t.integer "om_8", default: 0, null: false
    t.integer "om_9", default: 0, null: false
    t.integer "om_10", default: 0, null: false
    t.integer "om_11", default: 0, null: false
    t.integer "om_12", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "twenty_fives", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.integer "year", default: 2025, null: false
    t.integer "m_1", default: 0, null: false
    t.integer "m_2", default: 0, null: false
    t.integer "m_3", default: 0, null: false
    t.integer "c_1", default: 0, null: false
    t.integer "m_4", default: 0, null: false
    t.integer "m_5", default: 0, null: false
    t.integer "m_6", default: 0, null: false
    t.integer "c_2", default: 0, null: false
    t.integer "m_7", default: 0, null: false
    t.integer "m_8", default: 0, null: false
    t.integer "m_9", default: 0, null: false
    t.integer "c_3", default: 0, null: false
    t.integer "m_10", default: 0, null: false
    t.integer "m_11", default: 0, null: false
    t.integer "m_12", default: 0, null: false
    t.integer "c_4", default: 0, null: false
    t.integer "total", default: 0, null: false
    t.string "transfer_m_1", default: "未送金", null: false
    t.string "transfer_m_2", default: "未送金", null: false
    t.string "transfer_m_3", default: "未送金", null: false
    t.string "transfer_c_1", default: "未送金", null: false
    t.string "transfer_m_4", default: "未送金", null: false
    t.string "transfer_m_5", default: "未送金", null: false
    t.string "transfer_m_6", default: "未送金", null: false
    t.string "transfer_c_2", default: "未送金", null: false
    t.string "transfer_m_7", default: "未送金", null: false
    t.string "transfer_m_8", default: "未送金", null: false
    t.string "transfer_m_9", default: "未送金", null: false
    t.string "transfer_c_3", default: "未送金", null: false
    t.string "transfer_m_10", default: "未送金", null: false
    t.string "transfer_m_11", default: "未送金", null: false
    t.string "transfer_m_12", default: "未送金", null: false
    t.string "transfer_c_4", default: "未送金", null: false
    t.string "sp_transfer_1", default: "未送金", null: false
    t.string "sp_transfer_2", default: "未送金", null: false
    t.string "sp_transfer_3", default: "未送金", null: false
    t.string "sp_transfer_4", default: "未送金", null: false
    t.string "sp_transfer_5", default: "未送金", null: false
    t.string "sp_transfer_6", default: "未送金", null: false
    t.string "sp_transfer_7", default: "未送金", null: false
    t.string "sp_transfer_8", default: "未送金", null: false
    t.string "sp_transfer_9", default: "未送金", null: false
    t.string "sp_transfer_10", default: "未送金", null: false
    t.string "sp_transfer_11", default: "未送金", null: false
    t.string "sp_transfer_12", default: "未送金", null: false
    t.integer "pt_special_1", default: 0, null: false
    t.integer "pt_special_2", default: 0, null: false
    t.integer "pt_special_3", default: 0, null: false
    t.integer "pt_special_4", default: 0, null: false
    t.integer "pt_special_5", default: 0, null: false
    t.integer "pt_special_6", default: 0, null: false
    t.integer "pt_special_7", default: 0, null: false
    t.integer "pt_special_8", default: 0, null: false
    t.integer "pt_special_9", default: 0, null: false
    t.integer "pt_special_10", default: 0, null: false
    t.integer "pt_special_11", default: 0, null: false
    t.integer "pt_special_12", default: 0, null: false
    t.string "cache_payment_1", default: "未送金", null: false
    t.string "cache_payment_2", default: "未送金", null: false
    t.string "cache_payment_3", default: "未送金", null: false
    t.string "bonus_payment_1", default: "未送金", null: false
    t.string "cache_payment_4", default: "未送金", null: false
    t.string "cache_payment_5", default: "未送金", null: false
    t.string "cache_payment_6", default: "未送金", null: false
    t.string "bonus_payment_2", default: "未送金", null: false
    t.string "cache_payment_7", default: "未送金", null: false
    t.string "cache_payment_8", default: "未送金", null: false
    t.string "cache_payment_9", default: "未送金", null: false
    t.string "bonus_payment_3", default: "未送金", null: false
    t.string "cache_payment_10", default: "未送金", null: false
    t.string "cache_payment_11", default: "未送金", null: false
    t.string "cache_payment_12", default: "未送金", null: false
    t.string "bonus_payment_4", default: "未送金", null: false
    t.string "special_payment_1", default: "未送金", null: false
    t.string "special_payment_2", default: "未送金", null: false
    t.string "special_payment_3", default: "未送金", null: false
    t.string "special_payment_4", default: "未送金", null: false
    t.string "special_payment_5", default: "未送金", null: false
    t.string "special_payment_6", default: "未送金", null: false
    t.string "special_payment_7", default: "未送金", null: false
    t.string "special_payment_8", default: "未送金", null: false
    t.string "special_payment_9", default: "未送金", null: false
    t.string "special_payment_10", default: "未送金", null: false
    t.string "special_payment_11", default: "未送金", null: false
    t.string "special_payment_12", default: "未送金", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["c_1"], name: "index_twenty_fives_on_c_1"
    t.index ["c_2"], name: "index_twenty_fives_on_c_2"
    t.index ["c_3"], name: "index_twenty_fives_on_c_3"
    t.index ["c_4"], name: "index_twenty_fives_on_c_4"
    t.index ["customer_id"], name: "index_twenty_fives_on_customer_id"
    t.index ["m_1"], name: "index_twenty_fives_on_m_1"
    t.index ["m_10"], name: "index_twenty_fives_on_m_10"
    t.index ["m_11"], name: "index_twenty_fives_on_m_11"
    t.index ["m_12"], name: "index_twenty_fives_on_m_12"
    t.index ["m_2"], name: "index_twenty_fives_on_m_2"
    t.index ["m_3"], name: "index_twenty_fives_on_m_3"
    t.index ["m_4"], name: "index_twenty_fives_on_m_4"
    t.index ["m_5"], name: "index_twenty_fives_on_m_5"
    t.index ["m_6"], name: "index_twenty_fives_on_m_6"
    t.index ["m_7"], name: "index_twenty_fives_on_m_7"
    t.index ["m_8"], name: "index_twenty_fives_on_m_8"
    t.index ["m_9"], name: "index_twenty_fives_on_m_9"
    t.index ["pt_special_1"], name: "index_twenty_fives_on_pt_special_1"
    t.index ["pt_special_10"], name: "index_twenty_fives_on_pt_special_10"
    t.index ["pt_special_11"], name: "index_twenty_fives_on_pt_special_11"
    t.index ["pt_special_12"], name: "index_twenty_fives_on_pt_special_12"
    t.index ["pt_special_2"], name: "index_twenty_fives_on_pt_special_2"
    t.index ["pt_special_3"], name: "index_twenty_fives_on_pt_special_3"
    t.index ["pt_special_4"], name: "index_twenty_fives_on_pt_special_4"
    t.index ["pt_special_5"], name: "index_twenty_fives_on_pt_special_5"
    t.index ["pt_special_6"], name: "index_twenty_fives_on_pt_special_6"
    t.index ["pt_special_7"], name: "index_twenty_fives_on_pt_special_7"
    t.index ["pt_special_8"], name: "index_twenty_fives_on_pt_special_8"
    t.index ["pt_special_9"], name: "index_twenty_fives_on_pt_special_9"
  end

  create_table "twenty_four_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "om_1", default: 0, null: false
    t.integer "om_2", default: 0, null: false
    t.integer "om_3", default: 0, null: false
    t.integer "om_4", default: 0, null: false
    t.integer "om_5", default: 0, null: false
    t.integer "om_6", default: 0, null: false
    t.integer "om_7", default: 0, null: false
    t.integer "om_8", default: 0, null: false
    t.integer "om_9", default: 0, null: false
    t.integer "om_10", default: 0, null: false
    t.integer "om_11", default: 0, null: false
    t.integer "om_12", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "twenty_fours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.integer "year", default: 2024, null: false
    t.integer "m_1", default: 0, null: false
    t.integer "m_2", default: 0, null: false
    t.integer "m_3", default: 0, null: false
    t.integer "c_1", default: 0, null: false
    t.integer "m_4", default: 0, null: false
    t.integer "m_5", default: 0, null: false
    t.integer "m_6", default: 0, null: false
    t.integer "c_2", default: 0, null: false
    t.integer "m_7", default: 0, null: false
    t.integer "m_8", default: 0, null: false
    t.integer "m_9", default: 0, null: false
    t.integer "c_3", default: 0, null: false
    t.integer "m_10", default: 0, null: false
    t.integer "m_11", default: 0, null: false
    t.integer "m_12", default: 0, null: false
    t.integer "c_4", default: 0, null: false
    t.integer "total", default: 0, null: false
    t.string "transfer_m_1", default: "未送金", null: false
    t.string "transfer_m_2", default: "未送金", null: false
    t.string "transfer_m_3", default: "未送金", null: false
    t.string "transfer_c_1", default: "未送金", null: false
    t.string "transfer_m_4", default: "未送金", null: false
    t.string "transfer_m_5", default: "未送金", null: false
    t.string "transfer_m_6", default: "未送金", null: false
    t.string "transfer_c_2", default: "未送金", null: false
    t.string "transfer_m_7", default: "未送金", null: false
    t.string "transfer_m_8", default: "未送金", null: false
    t.string "transfer_m_9", default: "未送金", null: false
    t.string "transfer_c_3", default: "未送金", null: false
    t.string "transfer_m_10", default: "未送金", null: false
    t.string "transfer_m_11", default: "未送金", null: false
    t.string "transfer_m_12", default: "未送金", null: false
    t.string "transfer_c_4", default: "未送金", null: false
    t.string "sp_transfer_1", default: "未送金", null: false
    t.string "sp_transfer_2", default: "未送金", null: false
    t.string "sp_transfer_3", default: "未送金", null: false
    t.string "sp_transfer_4", default: "未送金", null: false
    t.string "sp_transfer_5", default: "未送金", null: false
    t.string "sp_transfer_6", default: "未送金", null: false
    t.string "sp_transfer_7", default: "未送金", null: false
    t.string "sp_transfer_8", default: "未送金", null: false
    t.string "sp_transfer_9", default: "未送金", null: false
    t.string "sp_transfer_10", default: "未送金", null: false
    t.string "sp_transfer_11", default: "未送金", null: false
    t.string "sp_transfer_12", default: "未送金", null: false
    t.integer "pt_special_1", default: 0, null: false
    t.integer "pt_special_2", default: 0, null: false
    t.integer "pt_special_3", default: 0, null: false
    t.integer "pt_special_4", default: 0, null: false
    t.integer "pt_special_5", default: 0, null: false
    t.integer "pt_special_6", default: 0, null: false
    t.integer "pt_special_7", default: 0, null: false
    t.integer "pt_special_8", default: 0, null: false
    t.integer "pt_special_9", default: 0, null: false
    t.integer "pt_special_10", default: 0, null: false
    t.integer "pt_special_11", default: 0, null: false
    t.integer "pt_special_12", default: 0, null: false
    t.string "cache_payment_1", default: "未送金", null: false
    t.string "cache_payment_2", default: "未送金", null: false
    t.string "cache_payment_3", default: "未送金", null: false
    t.string "bonus_payment_1", default: "未送金", null: false
    t.string "cache_payment_4", default: "未送金", null: false
    t.string "cache_payment_5", default: "未送金", null: false
    t.string "cache_payment_6", default: "未送金", null: false
    t.string "bonus_payment_2", default: "未送金", null: false
    t.string "cache_payment_7", default: "未送金", null: false
    t.string "cache_payment_8", default: "未送金", null: false
    t.string "cache_payment_9", default: "未送金", null: false
    t.string "bonus_payment_3", default: "未送金", null: false
    t.string "cache_payment_10", default: "未送金", null: false
    t.string "cache_payment_11", default: "未送金", null: false
    t.string "cache_payment_12", default: "未送金", null: false
    t.string "bonus_payment_4", default: "未送金", null: false
    t.string "special_payment_1", default: "未送金", null: false
    t.string "special_payment_2", default: "未送金", null: false
    t.string "special_payment_3", default: "未送金", null: false
    t.string "special_payment_4", default: "未送金", null: false
    t.string "special_payment_5", default: "未送金", null: false
    t.string "special_payment_6", default: "未送金", null: false
    t.string "special_payment_7", default: "未送金", null: false
    t.string "special_payment_8", default: "未送金", null: false
    t.string "special_payment_9", default: "未送金", null: false
    t.string "special_payment_10", default: "未送金", null: false
    t.string "special_payment_11", default: "未送金", null: false
    t.string "special_payment_12", default: "未送金", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["c_1"], name: "index_twenty_fours_on_c_1"
    t.index ["c_2"], name: "index_twenty_fours_on_c_2"
    t.index ["c_3"], name: "index_twenty_fours_on_c_3"
    t.index ["c_4"], name: "index_twenty_fours_on_c_4"
    t.index ["customer_id"], name: "index_twenty_fours_on_customer_id"
    t.index ["m_1"], name: "index_twenty_fours_on_m_1"
    t.index ["m_10"], name: "index_twenty_fours_on_m_10"
    t.index ["m_11"], name: "index_twenty_fours_on_m_11"
    t.index ["m_12"], name: "index_twenty_fours_on_m_12"
    t.index ["m_2"], name: "index_twenty_fours_on_m_2"
    t.index ["m_3"], name: "index_twenty_fours_on_m_3"
    t.index ["m_4"], name: "index_twenty_fours_on_m_4"
    t.index ["m_5"], name: "index_twenty_fours_on_m_5"
    t.index ["m_6"], name: "index_twenty_fours_on_m_6"
    t.index ["m_7"], name: "index_twenty_fours_on_m_7"
    t.index ["m_8"], name: "index_twenty_fours_on_m_8"
    t.index ["m_9"], name: "index_twenty_fours_on_m_9"
    t.index ["pt_special_1"], name: "index_twenty_fours_on_pt_special_1"
    t.index ["pt_special_10"], name: "index_twenty_fours_on_pt_special_10"
    t.index ["pt_special_11"], name: "index_twenty_fours_on_pt_special_11"
    t.index ["pt_special_12"], name: "index_twenty_fours_on_pt_special_12"
    t.index ["pt_special_2"], name: "index_twenty_fours_on_pt_special_2"
    t.index ["pt_special_3"], name: "index_twenty_fours_on_pt_special_3"
    t.index ["pt_special_4"], name: "index_twenty_fours_on_pt_special_4"
    t.index ["pt_special_5"], name: "index_twenty_fours_on_pt_special_5"
    t.index ["pt_special_6"], name: "index_twenty_fours_on_pt_special_6"
    t.index ["pt_special_7"], name: "index_twenty_fours_on_pt_special_7"
    t.index ["pt_special_8"], name: "index_twenty_fours_on_pt_special_8"
    t.index ["pt_special_9"], name: "index_twenty_fours_on_pt_special_9"
  end

  create_table "twenty_seven_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "om_1", default: 0, null: false
    t.integer "om_2", default: 0, null: false
    t.integer "om_3", default: 0, null: false
    t.integer "om_4", default: 0, null: false
    t.integer "om_5", default: 0, null: false
    t.integer "om_6", default: 0, null: false
    t.integer "om_7", default: 0, null: false
    t.integer "om_8", default: 0, null: false
    t.integer "om_9", default: 0, null: false
    t.integer "om_10", default: 0, null: false
    t.integer "om_11", default: 0, null: false
    t.integer "om_12", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "twenty_sevens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.integer "year", default: 2027, null: false
    t.integer "m_1", default: 0, null: false
    t.integer "m_2", default: 0, null: false
    t.integer "m_3", default: 0, null: false
    t.integer "c_1", default: 0, null: false
    t.integer "m_4", default: 0, null: false
    t.integer "m_5", default: 0, null: false
    t.integer "m_6", default: 0, null: false
    t.integer "c_2", default: 0, null: false
    t.integer "m_7", default: 0, null: false
    t.integer "m_8", default: 0, null: false
    t.integer "m_9", default: 0, null: false
    t.integer "c_3", default: 0, null: false
    t.integer "m_10", default: 0, null: false
    t.integer "m_11", default: 0, null: false
    t.integer "m_12", default: 0, null: false
    t.integer "c_4", default: 0, null: false
    t.integer "total", default: 0, null: false
    t.string "transfer_m_1", default: "未送金", null: false
    t.string "transfer_m_2", default: "未送金", null: false
    t.string "transfer_m_3", default: "未送金", null: false
    t.string "transfer_c_1", default: "未送金", null: false
    t.string "transfer_m_4", default: "未送金", null: false
    t.string "transfer_m_5", default: "未送金", null: false
    t.string "transfer_m_6", default: "未送金", null: false
    t.string "transfer_c_2", default: "未送金", null: false
    t.string "transfer_m_7", default: "未送金", null: false
    t.string "transfer_m_8", default: "未送金", null: false
    t.string "transfer_m_9", default: "未送金", null: false
    t.string "transfer_c_3", default: "未送金", null: false
    t.string "transfer_m_10", default: "未送金", null: false
    t.string "transfer_m_11", default: "未送金", null: false
    t.string "transfer_m_12", default: "未送金", null: false
    t.string "transfer_c_4", default: "未送金", null: false
    t.string "sp_transfer_1", default: "未送金", null: false
    t.string "sp_transfer_2", default: "未送金", null: false
    t.string "sp_transfer_3", default: "未送金", null: false
    t.string "sp_transfer_4", default: "未送金", null: false
    t.string "sp_transfer_5", default: "未送金", null: false
    t.string "sp_transfer_6", default: "未送金", null: false
    t.string "sp_transfer_7", default: "未送金", null: false
    t.string "sp_transfer_8", default: "未送金", null: false
    t.string "sp_transfer_9", default: "未送金", null: false
    t.string "sp_transfer_10", default: "未送金", null: false
    t.string "sp_transfer_11", default: "未送金", null: false
    t.string "sp_transfer_12", default: "未送金", null: false
    t.integer "pt_special_1", default: 0, null: false
    t.integer "pt_special_2", default: 0, null: false
    t.integer "pt_special_3", default: 0, null: false
    t.integer "pt_special_4", default: 0, null: false
    t.integer "pt_special_5", default: 0, null: false
    t.integer "pt_special_6", default: 0, null: false
    t.integer "pt_special_7", default: 0, null: false
    t.integer "pt_special_8", default: 0, null: false
    t.integer "pt_special_9", default: 0, null: false
    t.integer "pt_special_10", default: 0, null: false
    t.integer "pt_special_11", default: 0, null: false
    t.integer "pt_special_12", default: 0, null: false
    t.string "cache_payment_1", default: "未送金", null: false
    t.string "cache_payment_2", default: "未送金", null: false
    t.string "cache_payment_3", default: "未送金", null: false
    t.string "bonus_payment_1", default: "未送金", null: false
    t.string "cache_payment_4", default: "未送金", null: false
    t.string "cache_payment_5", default: "未送金", null: false
    t.string "cache_payment_6", default: "未送金", null: false
    t.string "bonus_payment_2", default: "未送金", null: false
    t.string "cache_payment_7", default: "未送金", null: false
    t.string "cache_payment_8", default: "未送金", null: false
    t.string "cache_payment_9", default: "未送金", null: false
    t.string "bonus_payment_3", default: "未送金", null: false
    t.string "cache_payment_10", default: "未送金", null: false
    t.string "cache_payment_11", default: "未送金", null: false
    t.string "cache_payment_12", default: "未送金", null: false
    t.string "bonus_payment_4", default: "未送金", null: false
    t.string "special_payment_1", default: "未送金", null: false
    t.string "special_payment_2", default: "未送金", null: false
    t.string "special_payment_3", default: "未送金", null: false
    t.string "special_payment_4", default: "未送金", null: false
    t.string "special_payment_5", default: "未送金", null: false
    t.string "special_payment_6", default: "未送金", null: false
    t.string "special_payment_7", default: "未送金", null: false
    t.string "special_payment_8", default: "未送金", null: false
    t.string "special_payment_9", default: "未送金", null: false
    t.string "special_payment_10", default: "未送金", null: false
    t.string "special_payment_11", default: "未送金", null: false
    t.string "special_payment_12", default: "未送金", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["c_1"], name: "index_twenty_sevens_on_c_1"
    t.index ["c_2"], name: "index_twenty_sevens_on_c_2"
    t.index ["c_3"], name: "index_twenty_sevens_on_c_3"
    t.index ["c_4"], name: "index_twenty_sevens_on_c_4"
    t.index ["customer_id"], name: "index_twenty_sevens_on_customer_id"
    t.index ["m_1"], name: "index_twenty_sevens_on_m_1"
    t.index ["m_10"], name: "index_twenty_sevens_on_m_10"
    t.index ["m_11"], name: "index_twenty_sevens_on_m_11"
    t.index ["m_12"], name: "index_twenty_sevens_on_m_12"
    t.index ["m_2"], name: "index_twenty_sevens_on_m_2"
    t.index ["m_3"], name: "index_twenty_sevens_on_m_3"
    t.index ["m_4"], name: "index_twenty_sevens_on_m_4"
    t.index ["m_5"], name: "index_twenty_sevens_on_m_5"
    t.index ["m_6"], name: "index_twenty_sevens_on_m_6"
    t.index ["m_7"], name: "index_twenty_sevens_on_m_7"
    t.index ["m_8"], name: "index_twenty_sevens_on_m_8"
    t.index ["m_9"], name: "index_twenty_sevens_on_m_9"
    t.index ["pt_special_1"], name: "index_twenty_sevens_on_pt_special_1"
    t.index ["pt_special_10"], name: "index_twenty_sevens_on_pt_special_10"
    t.index ["pt_special_11"], name: "index_twenty_sevens_on_pt_special_11"
    t.index ["pt_special_12"], name: "index_twenty_sevens_on_pt_special_12"
    t.index ["pt_special_2"], name: "index_twenty_sevens_on_pt_special_2"
    t.index ["pt_special_3"], name: "index_twenty_sevens_on_pt_special_3"
    t.index ["pt_special_4"], name: "index_twenty_sevens_on_pt_special_4"
    t.index ["pt_special_5"], name: "index_twenty_sevens_on_pt_special_5"
    t.index ["pt_special_6"], name: "index_twenty_sevens_on_pt_special_6"
    t.index ["pt_special_7"], name: "index_twenty_sevens_on_pt_special_7"
    t.index ["pt_special_8"], name: "index_twenty_sevens_on_pt_special_8"
    t.index ["pt_special_9"], name: "index_twenty_sevens_on_pt_special_9"
  end

  create_table "twenty_six_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "om_1", default: 0, null: false
    t.integer "om_2", default: 0, null: false
    t.integer "om_3", default: 0, null: false
    t.integer "om_4", default: 0, null: false
    t.integer "om_5", default: 0, null: false
    t.integer "om_6", default: 0, null: false
    t.integer "om_7", default: 0, null: false
    t.integer "om_8", default: 0, null: false
    t.integer "om_9", default: 0, null: false
    t.integer "om_10", default: 0, null: false
    t.integer "om_11", default: 0, null: false
    t.integer "om_12", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "twenty_sixes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.integer "year", default: 2026, null: false
    t.integer "m_1", default: 0, null: false
    t.integer "m_2", default: 0, null: false
    t.integer "m_3", default: 0, null: false
    t.integer "c_1", default: 0, null: false
    t.integer "m_4", default: 0, null: false
    t.integer "m_5", default: 0, null: false
    t.integer "m_6", default: 0, null: false
    t.integer "c_2", default: 0, null: false
    t.integer "m_7", default: 0, null: false
    t.integer "m_8", default: 0, null: false
    t.integer "m_9", default: 0, null: false
    t.integer "c_3", default: 0, null: false
    t.integer "m_10", default: 0, null: false
    t.integer "m_11", default: 0, null: false
    t.integer "m_12", default: 0, null: false
    t.integer "c_4", default: 0, null: false
    t.integer "total", default: 0, null: false
    t.string "transfer_m_1", default: "未送金", null: false
    t.string "transfer_m_2", default: "未送金", null: false
    t.string "transfer_m_3", default: "未送金", null: false
    t.string "transfer_c_1", default: "未送金", null: false
    t.string "transfer_m_4", default: "未送金", null: false
    t.string "transfer_m_5", default: "未送金", null: false
    t.string "transfer_m_6", default: "未送金", null: false
    t.string "transfer_c_2", default: "未送金", null: false
    t.string "transfer_m_7", default: "未送金", null: false
    t.string "transfer_m_8", default: "未送金", null: false
    t.string "transfer_m_9", default: "未送金", null: false
    t.string "transfer_c_3", default: "未送金", null: false
    t.string "transfer_m_10", default: "未送金", null: false
    t.string "transfer_m_11", default: "未送金", null: false
    t.string "transfer_m_12", default: "未送金", null: false
    t.string "transfer_c_4", default: "未送金", null: false
    t.string "sp_transfer_1", default: "未送金", null: false
    t.string "sp_transfer_2", default: "未送金", null: false
    t.string "sp_transfer_3", default: "未送金", null: false
    t.string "sp_transfer_4", default: "未送金", null: false
    t.string "sp_transfer_5", default: "未送金", null: false
    t.string "sp_transfer_6", default: "未送金", null: false
    t.string "sp_transfer_7", default: "未送金", null: false
    t.string "sp_transfer_8", default: "未送金", null: false
    t.string "sp_transfer_9", default: "未送金", null: false
    t.string "sp_transfer_10", default: "未送金", null: false
    t.string "sp_transfer_11", default: "未送金", null: false
    t.string "sp_transfer_12", default: "未送金", null: false
    t.integer "pt_special_1", default: 0, null: false
    t.integer "pt_special_2", default: 0, null: false
    t.integer "pt_special_3", default: 0, null: false
    t.integer "pt_special_4", default: 0, null: false
    t.integer "pt_special_5", default: 0, null: false
    t.integer "pt_special_6", default: 0, null: false
    t.integer "pt_special_7", default: 0, null: false
    t.integer "pt_special_8", default: 0, null: false
    t.integer "pt_special_9", default: 0, null: false
    t.integer "pt_special_10", default: 0, null: false
    t.integer "pt_special_11", default: 0, null: false
    t.integer "pt_special_12", default: 0, null: false
    t.string "cache_payment_1", default: "未送金", null: false
    t.string "cache_payment_2", default: "未送金", null: false
    t.string "cache_payment_3", default: "未送金", null: false
    t.string "bonus_payment_1", default: "未送金", null: false
    t.string "cache_payment_4", default: "未送金", null: false
    t.string "cache_payment_5", default: "未送金", null: false
    t.string "cache_payment_6", default: "未送金", null: false
    t.string "bonus_payment_2", default: "未送金", null: false
    t.string "cache_payment_7", default: "未送金", null: false
    t.string "cache_payment_8", default: "未送金", null: false
    t.string "cache_payment_9", default: "未送金", null: false
    t.string "bonus_payment_3", default: "未送金", null: false
    t.string "cache_payment_10", default: "未送金", null: false
    t.string "cache_payment_11", default: "未送金", null: false
    t.string "cache_payment_12", default: "未送金", null: false
    t.string "bonus_payment_4", default: "未送金", null: false
    t.string "special_payment_1", default: "未送金", null: false
    t.string "special_payment_2", default: "未送金", null: false
    t.string "special_payment_3", default: "未送金", null: false
    t.string "special_payment_4", default: "未送金", null: false
    t.string "special_payment_5", default: "未送金", null: false
    t.string "special_payment_6", default: "未送金", null: false
    t.string "special_payment_7", default: "未送金", null: false
    t.string "special_payment_8", default: "未送金", null: false
    t.string "special_payment_9", default: "未送金", null: false
    t.string "special_payment_10", default: "未送金", null: false
    t.string "special_payment_11", default: "未送金", null: false
    t.string "special_payment_12", default: "未送金", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["c_1"], name: "index_twenty_sixes_on_c_1"
    t.index ["c_2"], name: "index_twenty_sixes_on_c_2"
    t.index ["c_3"], name: "index_twenty_sixes_on_c_3"
    t.index ["c_4"], name: "index_twenty_sixes_on_c_4"
    t.index ["customer_id"], name: "index_twenty_sixes_on_customer_id"
    t.index ["m_1"], name: "index_twenty_sixes_on_m_1"
    t.index ["m_10"], name: "index_twenty_sixes_on_m_10"
    t.index ["m_11"], name: "index_twenty_sixes_on_m_11"
    t.index ["m_12"], name: "index_twenty_sixes_on_m_12"
    t.index ["m_2"], name: "index_twenty_sixes_on_m_2"
    t.index ["m_3"], name: "index_twenty_sixes_on_m_3"
    t.index ["m_4"], name: "index_twenty_sixes_on_m_4"
    t.index ["m_5"], name: "index_twenty_sixes_on_m_5"
    t.index ["m_6"], name: "index_twenty_sixes_on_m_6"
    t.index ["m_7"], name: "index_twenty_sixes_on_m_7"
    t.index ["m_8"], name: "index_twenty_sixes_on_m_8"
    t.index ["m_9"], name: "index_twenty_sixes_on_m_9"
    t.index ["pt_special_1"], name: "index_twenty_sixes_on_pt_special_1"
    t.index ["pt_special_10"], name: "index_twenty_sixes_on_pt_special_10"
    t.index ["pt_special_11"], name: "index_twenty_sixes_on_pt_special_11"
    t.index ["pt_special_12"], name: "index_twenty_sixes_on_pt_special_12"
    t.index ["pt_special_2"], name: "index_twenty_sixes_on_pt_special_2"
    t.index ["pt_special_3"], name: "index_twenty_sixes_on_pt_special_3"
    t.index ["pt_special_4"], name: "index_twenty_sixes_on_pt_special_4"
    t.index ["pt_special_5"], name: "index_twenty_sixes_on_pt_special_5"
    t.index ["pt_special_6"], name: "index_twenty_sixes_on_pt_special_6"
    t.index ["pt_special_7"], name: "index_twenty_sixes_on_pt_special_7"
    t.index ["pt_special_8"], name: "index_twenty_sixes_on_pt_special_8"
    t.index ["pt_special_9"], name: "index_twenty_sixes_on_pt_special_9"
  end

  create_table "twenty_three_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "om_1", default: 0, null: false
    t.integer "om_2", default: 0, null: false
    t.integer "om_3", default: 0, null: false
    t.integer "om_4", default: 0, null: false
    t.integer "om_5", default: 0, null: false
    t.integer "om_6", default: 0, null: false
    t.integer "om_7", default: 0, null: false
    t.integer "om_8", default: 0, null: false
    t.integer "om_9", default: 0, null: false
    t.integer "om_10", default: 0, null: false
    t.integer "om_11", default: 0, null: false
    t.integer "om_12", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "twenty_threes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.integer "year", default: 2023, null: false
    t.integer "m_1", default: 0, null: false
    t.integer "m_2", default: 0, null: false
    t.integer "m_3", default: 0, null: false
    t.integer "c_1", default: 0, null: false
    t.integer "m_4", default: 0, null: false
    t.integer "m_5", default: 0, null: false
    t.integer "m_6", default: 0, null: false
    t.integer "c_2", default: 0, null: false
    t.integer "m_7", default: 0, null: false
    t.integer "m_8", default: 0, null: false
    t.integer "m_9", default: 0, null: false
    t.integer "c_3", default: 0, null: false
    t.integer "m_10", default: 0, null: false
    t.integer "m_11", default: 0, null: false
    t.integer "m_12", default: 0, null: false
    t.integer "c_4", default: 0, null: false
    t.integer "total", default: 0, null: false
    t.string "transfer_m_1", default: "未送金", null: false
    t.string "transfer_m_2", default: "未送金", null: false
    t.string "transfer_m_3", default: "未送金", null: false
    t.string "transfer_c_1", default: "未送金", null: false
    t.string "transfer_m_4", default: "未送金", null: false
    t.string "transfer_m_5", default: "未送金", null: false
    t.string "transfer_m_6", default: "未送金", null: false
    t.string "transfer_c_2", default: "未送金", null: false
    t.string "transfer_m_7", default: "未送金", null: false
    t.string "transfer_m_8", default: "未送金", null: false
    t.string "transfer_m_9", default: "未送金", null: false
    t.string "transfer_c_3", default: "未送金", null: false
    t.string "transfer_m_10", default: "未送金", null: false
    t.string "transfer_m_11", default: "未送金", null: false
    t.string "transfer_m_12", default: "未送金", null: false
    t.string "transfer_c_4", default: "未送金", null: false
    t.string "sp_transfer_1", default: "未送金", null: false
    t.string "sp_transfer_2", default: "未送金", null: false
    t.string "sp_transfer_3", default: "未送金", null: false
    t.string "sp_transfer_4", default: "未送金", null: false
    t.string "sp_transfer_5", default: "未送金", null: false
    t.string "sp_transfer_6", default: "未送金", null: false
    t.string "sp_transfer_7", default: "未送金", null: false
    t.string "sp_transfer_8", default: "未送金", null: false
    t.string "sp_transfer_9", default: "未送金", null: false
    t.string "sp_transfer_10", default: "未送金", null: false
    t.string "sp_transfer_11", default: "未送金", null: false
    t.string "sp_transfer_12", default: "未送金", null: false
    t.integer "pt_special_1", default: 0, null: false
    t.integer "pt_special_2", default: 0, null: false
    t.integer "pt_special_3", default: 0, null: false
    t.integer "pt_special_4", default: 0, null: false
    t.integer "pt_special_5", default: 0, null: false
    t.integer "pt_special_6", default: 0, null: false
    t.integer "pt_special_7", default: 0, null: false
    t.integer "pt_special_8", default: 0, null: false
    t.integer "pt_special_9", default: 0, null: false
    t.integer "pt_special_10", default: 0, null: false
    t.integer "pt_special_11", default: 0, null: false
    t.integer "pt_special_12", default: 0, null: false
    t.string "cache_payment_1", default: "未送金", null: false
    t.string "cache_payment_2", default: "未送金", null: false
    t.string "cache_payment_3", default: "未送金", null: false
    t.string "bonus_payment_1", default: "未送金", null: false
    t.string "cache_payment_4", default: "未送金", null: false
    t.string "cache_payment_5", default: "未送金", null: false
    t.string "cache_payment_6", default: "未送金", null: false
    t.string "bonus_payment_2", default: "未送金", null: false
    t.string "cache_payment_7", default: "未送金", null: false
    t.string "cache_payment_8", default: "未送金", null: false
    t.string "cache_payment_9", default: "未送金", null: false
    t.string "bonus_payment_3", default: "未送金", null: false
    t.string "cache_payment_10", default: "未送金", null: false
    t.string "cache_payment_11", default: "未送金", null: false
    t.string "cache_payment_12", default: "未送金", null: false
    t.string "bonus_payment_4", default: "未送金", null: false
    t.string "special_payment_1", default: "未送金", null: false
    t.string "special_payment_2", default: "未送金", null: false
    t.string "special_payment_3", default: "未送金", null: false
    t.string "special_payment_4", default: "未送金", null: false
    t.string "special_payment_5", default: "未送金", null: false
    t.string "special_payment_6", default: "未送金", null: false
    t.string "special_payment_7", default: "未送金", null: false
    t.string "special_payment_8", default: "未送金", null: false
    t.string "special_payment_9", default: "未送金", null: false
    t.string "special_payment_10", default: "未送金", null: false
    t.string "special_payment_11", default: "未送金", null: false
    t.string "special_payment_12", default: "未送金", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["c_1"], name: "index_twenty_threes_on_c_1"
    t.index ["c_2"], name: "index_twenty_threes_on_c_2"
    t.index ["c_3"], name: "index_twenty_threes_on_c_3"
    t.index ["c_4"], name: "index_twenty_threes_on_c_4"
    t.index ["customer_id"], name: "index_twenty_threes_on_customer_id"
    t.index ["m_1"], name: "index_twenty_threes_on_m_1"
    t.index ["m_10"], name: "index_twenty_threes_on_m_10"
    t.index ["m_11"], name: "index_twenty_threes_on_m_11"
    t.index ["m_12"], name: "index_twenty_threes_on_m_12"
    t.index ["m_2"], name: "index_twenty_threes_on_m_2"
    t.index ["m_3"], name: "index_twenty_threes_on_m_3"
    t.index ["m_4"], name: "index_twenty_threes_on_m_4"
    t.index ["m_5"], name: "index_twenty_threes_on_m_5"
    t.index ["m_6"], name: "index_twenty_threes_on_m_6"
    t.index ["m_7"], name: "index_twenty_threes_on_m_7"
    t.index ["m_8"], name: "index_twenty_threes_on_m_8"
    t.index ["m_9"], name: "index_twenty_threes_on_m_9"
    t.index ["pt_special_1"], name: "index_twenty_threes_on_pt_special_1"
    t.index ["pt_special_10"], name: "index_twenty_threes_on_pt_special_10"
    t.index ["pt_special_11"], name: "index_twenty_threes_on_pt_special_11"
    t.index ["pt_special_12"], name: "index_twenty_threes_on_pt_special_12"
    t.index ["pt_special_2"], name: "index_twenty_threes_on_pt_special_2"
    t.index ["pt_special_3"], name: "index_twenty_threes_on_pt_special_3"
    t.index ["pt_special_4"], name: "index_twenty_threes_on_pt_special_4"
    t.index ["pt_special_5"], name: "index_twenty_threes_on_pt_special_5"
    t.index ["pt_special_6"], name: "index_twenty_threes_on_pt_special_6"
    t.index ["pt_special_7"], name: "index_twenty_threes_on_pt_special_7"
    t.index ["pt_special_8"], name: "index_twenty_threes_on_pt_special_8"
    t.index ["pt_special_9"], name: "index_twenty_threes_on_pt_special_9"
  end

  create_table "twenty_two_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "om_1", default: 0, null: false
    t.integer "om_2", default: 0, null: false
    t.integer "om_3", default: 0, null: false
    t.integer "om_4", default: 0, null: false
    t.integer "om_5", default: 0, null: false
    t.integer "om_6", default: 0, null: false
    t.integer "om_7", default: 0, null: false
    t.integer "om_8", default: 0, null: false
    t.integer "om_9", default: 0, null: false
    t.integer "om_10", default: 0, null: false
    t.integer "om_11", default: 0, null: false
    t.integer "om_12", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "twenty_twos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "customer_id", null: false
    t.integer "year", default: 2022, null: false
    t.integer "m_1", default: 0, null: false
    t.integer "m_2", default: 0, null: false
    t.integer "m_3", default: 0, null: false
    t.integer "c_1", default: 0, null: false
    t.integer "m_4", default: 0, null: false
    t.integer "m_5", default: 0, null: false
    t.integer "m_6", default: 0, null: false
    t.integer "c_2", default: 0, null: false
    t.integer "m_7", default: 0, null: false
    t.integer "m_8", default: 0, null: false
    t.integer "m_9", default: 0, null: false
    t.integer "c_3", default: 0, null: false
    t.integer "m_10", default: 0, null: false
    t.integer "m_11", default: 0, null: false
    t.integer "m_12", default: 0, null: false
    t.integer "c_4", default: 0, null: false
    t.integer "total", default: 0, null: false
    t.string "transfer_m_1", default: "未送金", null: false
    t.string "transfer_m_2", default: "未送金", null: false
    t.string "transfer_m_3", default: "未送金", null: false
    t.string "transfer_c_1", default: "未送金", null: false
    t.string "transfer_m_4", default: "未送金", null: false
    t.string "transfer_m_5", default: "未送金", null: false
    t.string "transfer_m_6", default: "未送金", null: false
    t.string "transfer_c_2", default: "未送金", null: false
    t.string "transfer_m_7", default: "未送金", null: false
    t.string "transfer_m_8", default: "未送金", null: false
    t.string "transfer_m_9", default: "未送金", null: false
    t.string "transfer_c_3", default: "未送金", null: false
    t.string "transfer_m_10", default: "未送金", null: false
    t.string "transfer_m_11", default: "未送金", null: false
    t.string "transfer_m_12", default: "未送金", null: false
    t.string "transfer_c_4", default: "未送金", null: false
    t.string "sp_transfer_1", default: "未送金", null: false
    t.string "sp_transfer_2", default: "未送金", null: false
    t.string "sp_transfer_3", default: "未送金", null: false
    t.string "sp_transfer_4", default: "未送金", null: false
    t.string "sp_transfer_5", default: "未送金", null: false
    t.string "sp_transfer_6", default: "未送金", null: false
    t.string "sp_transfer_7", default: "未送金", null: false
    t.string "sp_transfer_8", default: "未送金", null: false
    t.string "sp_transfer_9", default: "未送金", null: false
    t.string "sp_transfer_10", default: "未送金", null: false
    t.string "sp_transfer_11", default: "未送金", null: false
    t.string "sp_transfer_12", default: "未送金", null: false
    t.integer "pt_special_1", default: 0, null: false
    t.integer "pt_special_2", default: 0, null: false
    t.integer "pt_special_3", default: 0, null: false
    t.integer "pt_special_4", default: 0, null: false
    t.integer "pt_special_5", default: 0, null: false
    t.integer "pt_special_6", default: 0, null: false
    t.integer "pt_special_7", default: 0, null: false
    t.integer "pt_special_8", default: 0, null: false
    t.integer "pt_special_9", default: 0, null: false
    t.integer "pt_special_10", default: 0, null: false
    t.integer "pt_special_11", default: 0, null: false
    t.integer "pt_special_12", default: 0, null: false
    t.string "cache_payment_1", default: "未送金", null: false
    t.string "cache_payment_2", default: "未送金", null: false
    t.string "cache_payment_3", default: "未送金", null: false
    t.string "bonus_payment_1", default: "未送金", null: false
    t.string "cache_payment_4", default: "未送金", null: false
    t.string "cache_payment_5", default: "未送金", null: false
    t.string "cache_payment_6", default: "未送金", null: false
    t.string "bonus_payment_2", default: "未送金", null: false
    t.string "cache_payment_7", default: "未送金", null: false
    t.string "cache_payment_8", default: "未送金", null: false
    t.string "cache_payment_9", default: "未送金", null: false
    t.string "bonus_payment_3", default: "未送金", null: false
    t.string "cache_payment_10", default: "未送金", null: false
    t.string "cache_payment_11", default: "未送金", null: false
    t.string "cache_payment_12", default: "未送金", null: false
    t.string "bonus_payment_4", default: "未送金", null: false
    t.string "special_payment_1", default: "未送金", null: false
    t.string "special_payment_2", default: "未送金", null: false
    t.string "special_payment_3", default: "未送金", null: false
    t.string "special_payment_4", default: "未送金", null: false
    t.string "special_payment_5", default: "未送金", null: false
    t.string "special_payment_6", default: "未送金", null: false
    t.string "special_payment_7", default: "未送金", null: false
    t.string "special_payment_8", default: "未送金", null: false
    t.string "special_payment_9", default: "未送金", null: false
    t.string "special_payment_10", default: "未送金", null: false
    t.string "special_payment_11", default: "未送金", null: false
    t.string "special_payment_12", default: "未送金", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["c_1"], name: "index_twenty_twos_on_c_1"
    t.index ["c_2"], name: "index_twenty_twos_on_c_2"
    t.index ["c_3"], name: "index_twenty_twos_on_c_3"
    t.index ["c_4"], name: "index_twenty_twos_on_c_4"
    t.index ["customer_id"], name: "index_twenty_twos_on_customer_id"
    t.index ["m_1"], name: "index_twenty_twos_on_m_1"
    t.index ["m_10"], name: "index_twenty_twos_on_m_10"
    t.index ["m_11"], name: "index_twenty_twos_on_m_11"
    t.index ["m_12"], name: "index_twenty_twos_on_m_12"
    t.index ["m_2"], name: "index_twenty_twos_on_m_2"
    t.index ["m_3"], name: "index_twenty_twos_on_m_3"
    t.index ["m_4"], name: "index_twenty_twos_on_m_4"
    t.index ["m_5"], name: "index_twenty_twos_on_m_5"
    t.index ["m_6"], name: "index_twenty_twos_on_m_6"
    t.index ["m_7"], name: "index_twenty_twos_on_m_7"
    t.index ["m_8"], name: "index_twenty_twos_on_m_8"
    t.index ["m_9"], name: "index_twenty_twos_on_m_9"
    t.index ["pt_special_1"], name: "index_twenty_twos_on_pt_special_1"
    t.index ["pt_special_10"], name: "index_twenty_twos_on_pt_special_10"
    t.index ["pt_special_11"], name: "index_twenty_twos_on_pt_special_11"
    t.index ["pt_special_12"], name: "index_twenty_twos_on_pt_special_12"
    t.index ["pt_special_2"], name: "index_twenty_twos_on_pt_special_2"
    t.index ["pt_special_3"], name: "index_twenty_twos_on_pt_special_3"
    t.index ["pt_special_4"], name: "index_twenty_twos_on_pt_special_4"
    t.index ["pt_special_5"], name: "index_twenty_twos_on_pt_special_5"
    t.index ["pt_special_6"], name: "index_twenty_twos_on_pt_special_6"
    t.index ["pt_special_7"], name: "index_twenty_twos_on_pt_special_7"
    t.index ["pt_special_8"], name: "index_twenty_twos_on_pt_special_8"
    t.index ["pt_special_9"], name: "index_twenty_twos_on_pt_special_9"
  end

  create_table "years", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "year_check", default: 2018, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "customers"
  add_foreign_key "admin_events", "administrators"
  add_foreign_key "banks", "customers"
  add_foreign_key "eighteens", "customers"
  add_foreign_key "entries", "customers"
  add_foreign_key "entries", "programs"
  add_foreign_key "members", "customers"
  add_foreign_key "messages", "customers"
  add_foreign_key "messages", "messages", column: "parent_id"
  add_foreign_key "messages", "messages", column: "root_id"
  add_foreign_key "messages", "staff_members"
  add_foreign_key "nineteens", "customers"
  add_foreign_key "ones", "customers"
  add_foreign_key "phones", "addresses"
  add_foreign_key "phones", "customers"
  add_foreign_key "points", "customers"
  add_foreign_key "programs", "staff_members", column: "registrant_id"
  add_foreign_key "registers", "customers"
  add_foreign_key "scores", "customers"
  add_foreign_key "seventeens", "customers"
  add_foreign_key "specials", "customers"
  add_foreign_key "staff_events", "staff_members"
  add_foreign_key "twenties", "customers"
  add_foreign_key "twenty_fives", "customers"
  add_foreign_key "twenty_fours", "customers"
  add_foreign_key "twenty_sevens", "customers"
  add_foreign_key "twenty_sixes", "customers"
  add_foreign_key "twenty_threes", "customers"
  add_foreign_key "twenty_twos", "customers"
end
