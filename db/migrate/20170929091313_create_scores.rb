class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.references :customer, null: false               # 顧客への外部キー
      t.integer :sc_1, null: false, default: 0          # 1月
      t.integer :sc_2, null: false, default: 0          # 2月
      t.integer :sc_3, null: false, default: 0          # 3月
      t.integer :scc_1, null: false, default: 0         # 1クオーター
      t.integer :sc_4, null: false, default: 0          # 4月
      t.integer :sc_5, null: false, default: 0          # 5月
      t.integer :sc_6, null: false, default: 0          # 6月
      t.integer :scc_2, null: false, default: 0         # ２クオーター
      t.integer :sc_7, null: false, default: 0          # 7月
      t.integer :sc_8, null: false, default: 0          # 8月
      t.integer :sc_9, null: false, default: 0          # 9月
      t.integer :scc_3, null: false, default: 0         # 3クオーター
      t.integer :sc_10, null: false, default: 0         # 10月
      t.integer :sc_11, null: false, default: 0         # 11月
      t.integer :sc_12, null: false, default: 0         # 12月
      t.integer :scc_4, null: false, default: 0         # 4クオーター

      t.timestamps
    end
    
    add_foreign_key :scores, :customers
    add_index :scores, :sc_1
    add_index :scores, :sc_2
    add_index :scores, :sc_3
    add_index :scores, :scc_1
    add_index :scores, :sc_4
    add_index :scores, :sc_5
    add_index :scores, :sc_6
    add_index :scores, :scc_2
    add_index :scores, :sc_7
    add_index :scores, :sc_8
    add_index :scores, :sc_9
    add_index :scores, :scc_3
    add_index :scores, :sc_10
    add_index :scores, :sc_11
    add_index :scores, :sc_12
    add_index :scores, :scc_4 
  end
end
