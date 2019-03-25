class CreateRegisters < ActiveRecord::Migration[5.1]
  def change
    create_table :registers do |t|
      t.references :customer, null: false               # 顧客への外部キー
      t.string :rg_1, null: false, default: "退会"          # 1月
      t.string :rg_2, null: false, default: "退会"          # 2月
      t.string :rg_3, null: false, default: "退会"          # 3月
      t.string :rg_4, null: false, default: "退会"          # 4月
      t.string :rg_5, null: false, default: "退会"          # 5月
      t.string :rg_6, null: false, default: "退会"          # 6月
      t.string :rg_7, null: false, default: "退会"          # 7月
      t.string :rg_8, null: false, default: "退会"          # 8月
      t.string :rg_9, null: false, default: "退会"          # 9月
      t.string :rg_10, null: false, default: "退会"         # 10月
      t.string :rg_11, null: false, default: "退会"         # 11月
      t.string :rg_12, null: false, default: "退会"         # 12月

      t.timestamps
    end
    
    add_foreign_key :registers, :customers
    add_index :registers, :rg_1
    add_index :registers, :rg_2
    add_index :registers, :rg_3
    add_index :registers, :rg_4
    add_index :registers, :rg_5
    add_index :registers, :rg_6
    add_index :registers, :rg_7
    add_index :registers, :rg_8
    add_index :registers, :rg_9
    add_index :registers, :rg_10
    add_index :registers, :rg_11
    add_index :registers, :rg_12
  end
end
