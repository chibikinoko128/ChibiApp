class CreatePoints < ActiveRecord::Migration[5.1]
  def change
    create_table :points do |t|
      t.references :customer, null: false               # 顧客への外部キー
      #t.integer :customer_id, null: false
      t.integer :bns_1, null: false, default: 0          # 1月
      t.integer :bns_2, null: false, default: 0          # 2月
      t.integer :bns_3, null: false, default: 0          # 3月
      t.integer :cbns_1, null: false, default: 0         # 1クオーター
      t.integer :bns_4, null: false, default: 0          # 4月
      t.integer :bns_5, null: false, default: 0          # 5月
      t.integer :bns_6, null: false, default: 0          # 6月
      t.integer :cbns_2, null: false, default: 0         # 2クオーター
      t.integer :bns_7, null: false, default: 0          # 7月
      t.integer :bns_8, null: false, default: 0          # 8月
      t.integer :bns_9, null: false, default: 0          # 9月
      t.integer :cbns_3, null: false, default: 0         # 3クオーター
      t.integer :bns_10, null: false, default: 0         # 10月
      t.integer :bns_11, null: false, default: 0         # 11月
      t.integer :bns_12, null: false, default: 0         # 12月
      t.integer :cbns_4, null: false, default: 0         # 4クオーター
      
      t.timestamps
    end
    
    add_foreign_key :points, :customers
    add_index :points, :bns_1
    add_index :points, :bns_2
    add_index :points, :bns_3
    add_index :points, :cbns_1
    add_index :points, :bns_4
    add_index :points, :bns_5
    add_index :points, :bns_6
    add_index :points, :cbns_2
    add_index :points, :bns_7
    add_index :points, :bns_8
    add_index :points, :bns_9
    add_index :points, :cbns_3
    add_index :points, :bns_10
    add_index :points, :bns_11
    add_index :points, :bns_12
    add_index :points, :cbns_4 
  end
end
