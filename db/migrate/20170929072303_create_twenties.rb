class CreateTwenties < ActiveRecord::Migration[5.1]
  def change
    create_table :twenties do |t|
      t.references :customer, null: false               # 顧客への外部キー
      t.integer :year, null: false, default: 2020       # 年
      t.integer :m_1, null: false, default: 0           # 1月
      t.integer :m_2, null: false, default: 0           # 2月
      t.integer :m_3, null: false, default: 0           # 3月
      t.integer :c_1, null: false, default: 0           # 1クオーター
      t.integer :m_4, null: false, default: 0           # 4月
      t.integer :m_5, null: false, default: 0           # 5月
      t.integer :m_6, null: false, default: 0           # 6月
      t.integer :c_2, null: false, default: 0           # ２クオーター
      t.integer :m_7, null: false, default: 0           # 7月
      t.integer :m_8, null: false, default: 0           # 8月
      t.integer :m_9, null: false, default: 0           # 9月
      t.integer :c_3, null: false, default: 0           # 3クオーター
      t.integer :m_10, null: false, default: 0          # 10月
      t.integer :m_11, null: false, default: 0          # 11月
      t.integer :m_12, null: false, default: 0          # 12月
      t.integer :c_4, null: false, default: 0           # 4クオーター
      t.integer :total, null: false, default: 0         # トータル
      t.string :transfer_m_1, null: false, default: "未送金"
      t.string :transfer_m_2, null: false, default: "未送金"
      t.string :transfer_m_3, null: false, default: "未送金"
      t.string :transfer_c_1, null: false, default: "未送金"
      t.string :transfer_m_4, null: false, default: "未送金"
      t.string :transfer_m_5, null: false, default: "未送金"
      t.string :transfer_m_6, null: false, default: "未送金"
      t.string :transfer_c_2, null: false, default: "未送金"
      t.string :transfer_m_7, null: false, default: "未送金"
      t.string :transfer_m_8, null: false, default: "未送金"
      t.string :transfer_m_9, null: false, default: "未送金"
      t.string :transfer_c_3, null: false, default: "未送金"
      t.string :transfer_m_10, null: false, default: "未送金"
      t.string :transfer_m_11, null: false, default: "未送金"
      t.string :transfer_m_12, null: false, default: "未送金"
      t.string :transfer_c_4, null: false, default: "未送金"
      t.string :sp_transfer_1, null: false, default: "未送金"
      t.string :sp_transfer_2, null: false, default: "未送金"
      t.string :sp_transfer_3, null: false, default: "未送金"
      t.string :sp_transfer_4, null: false, default: "未送金"
      t.string :sp_transfer_5, null: false, default: "未送金"
      t.string :sp_transfer_6, null: false, default: "未送金" 
      t.string :sp_transfer_7, null: false, default: "未送金"
      t.string :sp_transfer_8, null: false, default: "未送金"
      t.string :sp_transfer_9, null: false, default: "未送金"
      t.string :sp_transfer_10, null: false, default: "未送金"
      t.string :sp_transfer_11, null: false, default: "未送金"
      t.string :sp_transfer_12, null: false, default: "未送金"
      
      t.integer :pt_special_1, null: false, default: 0           # 1月
      t.integer :pt_special_2, null: false, default: 0           # 2月
      t.integer :pt_special_3, null: false, default: 0           # 3月
      t.integer :pt_special_4, null: false, default: 0           # 4月
      t.integer :pt_special_5, null: false, default: 0           # 5月
      t.integer :pt_special_6, null: false, default: 0           # 6月
      t.integer :pt_special_7, null: false, default: 0           # 7月
      t.integer :pt_special_8, null: false, default: 0           # 8月
      t.integer :pt_special_9, null: false, default: 0           # 9月
      t.integer :pt_special_10, null: false, default: 0          # 10月
      t.integer :pt_special_11, null: false, default: 0          # 11月
      t.integer :pt_special_12, null: false, default: 0          # 12月
      
      t.string :cache_payment_1, null: false, default: "未送金"
      t.string :cache_payment_2, null: false, default: "未送金"
      t.string :cache_payment_3, null: false, default: "未送金"
      t.string :bonus_payment_1, null: false, default: "未送金"
      t.string :cache_payment_4, null: false, default: "未送金"
      t.string :cache_payment_5, null: false, default: "未送金"
      t.string :cache_payment_6, null: false, default: "未送金"
      t.string :bonus_payment_2, null: false, default: "未送金"
      t.string :cache_payment_7, null: false, default: "未送金"
      t.string :cache_payment_8, null: false, default: "未送金"
      t.string :cache_payment_9, null: false, default: "未送金"
      t.string :bonus_payment_3, null: false, default: "未送金"
      t.string :cache_payment_10, null: false, default: "未送金"
      t.string :cache_payment_11, null: false, default: "未送金"
      t.string :cache_payment_12, null: false, default: "未送金"
      t.string :bonus_payment_4, null: false, default: "未送金"
      t.string :special_payment_1, null: false, default: "未送金"
      t.string :special_payment_2, null: false, default: "未送金"
      t.string :special_payment_3, null: false, default: "未送金"
      t.string :special_payment_4, null: false, default: "未送金"
      t.string :special_payment_5, null: false, default: "未送金"
      t.string :special_payment_6, null: false, default: "未送金" 
      t.string :special_payment_7, null: false, default: "未送金"
      t.string :special_payment_8, null: false, default: "未送金"
      t.string :special_payment_9, null: false, default: "未送金"
      t.string :special_payment_10, null: false, default: "未送金"
      t.string :special_payment_11, null: false, default: "未送金"
      t.string :special_payment_12, null: false, default: "未送金"
      

      t.timestamps
    end
    
    add_foreign_key :twenties, :customers
    add_index :twenties, :m_1
    add_index :twenties, :m_2
    add_index :twenties, :m_3
    add_index :twenties, :c_1
    add_index :twenties, :m_4
    add_index :twenties, :m_5
    add_index :twenties, :m_6
    add_index :twenties, :c_2
    add_index :twenties, :m_7
    add_index :twenties, :m_8
    add_index :twenties, :m_9
    add_index :twenties, :c_3
    add_index :twenties, :m_10
    add_index :twenties, :m_11
    add_index :twenties, :m_12
    add_index :twenties, :c_4
    add_index :twenties, :pt_special_1
    add_index :twenties, :pt_special_2
    add_index :twenties, :pt_special_3
    add_index :twenties, :pt_special_4
    add_index :twenties, :pt_special_5
    add_index :twenties, :pt_special_6
    add_index :twenties, :pt_special_7
    add_index :twenties, :pt_special_8
    add_index :twenties, :pt_special_9
    add_index :twenties, :pt_special_10
    add_index :twenties, :pt_special_11
    add_index :twenties, :pt_special_12
  end
end
