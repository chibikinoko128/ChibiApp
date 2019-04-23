class CreateSeventeens < ActiveRecord::Migration[5.1]
  def change
    create_table :seventeens do |t|
      #t.references :customer, null: false              # 顧客への外部キー
      t.integer :customer_id, null: false
      t.integer :year, null: false, default: 2017       # 年
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

      t.timestamps
    end
    
    #add_foreign_key :seventeens, :customers
    add_index :seventeens, :m_1
    add_index :seventeens, :m_2
    add_index :seventeens, :m_3
    add_index :seventeens, :c_1
    add_index :seventeens, :m_4
    add_index :seventeens, :m_5
    add_index :seventeens, :m_6
    add_index :seventeens, :c_2
    add_index :seventeens, :m_7
    add_index :seventeens, :m_8
    add_index :seventeens, :m_9
    add_index :seventeens, :c_3
    add_index :seventeens, :m_10
    add_index :seventeens, :m_11
    add_index :seventeens, :m_12
    add_index :seventeens, :c_4
  end
end
