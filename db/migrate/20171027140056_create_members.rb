class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.references :customer, null: false               # 顧客への外部キー
      #t.integer :customer_id, null: false
      t.integer :mb_1, null: false, default: 0          # 1月
      t.integer :mb_2, null: false, default: 0          # 2月
      t.integer :mb_3, null: false, default: 0          # 3月
      t.integer :mbc_1, null: false, default: 0         # 1クオーター
      t.integer :mb_4, null: false, default: 0          # 4月
      t.integer :mb_5, null: false, default: 0          # 5月
      t.integer :mb_6, null: false, default: 0          # 6月
      t.integer :mbc_2, null: false, default: 0         # ２クオーター
      t.integer :mb_7, null: false, default: 0          # 7月
      t.integer :mb_8, null: false, default: 0          # 8月
      t.integer :mb_9, null: false, default: 0          # 9月
      t.integer :mbc_3, null: false, default: 0         # 3クオーター
      t.integer :mb_10, null: false, default: 0         # 10月
      t.integer :mb_11, null: false, default: 0         # 11月
      t.integer :mb_12, null: false, default: 0         # 12月
      t.integer :mbc_4, null: false, default: 0         # 4クオーター
      
      t.timestamps
    end
    
    add_foreign_key :members, :customers
    add_index :members, :mb_1
    add_index :members, :mb_2
    add_index :members, :mb_3
    add_index :members, :mbc_1
    add_index :members, :mb_4
    add_index :members, :mb_5
    add_index :members, :mb_6
    add_index :members, :mbc_2
    add_index :members, :mb_7
    add_index :members, :mb_8
    add_index :members, :mb_9
    add_index :members, :mbc_3
    add_index :members, :mb_10
    add_index :members, :mb_11
    add_index :members, :mb_12
    add_index :members, :mbc_4 
  end
end
