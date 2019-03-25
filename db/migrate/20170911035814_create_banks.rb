class CreateBanks < ActiveRecord::Migration[5.1]
  def change
    create_table :banks do |t|
      t.references :customer, null: false            # 顧客への外部キー
      t.string :bk_name, null: false, default: ''    # 銀行名
      t.string :office, null: false, default: ''     # 支店
      t.integer :account      # 口座番号
      t.string :bk_name_check, null: false, default: ''    # 銀行名
      t.string :office_check, null: false, default: ''     # 支店
      t.integer :account_check      # 口座番号
      t.string :web_registration, null: false, default: '未登録'
      
      t.timestamps
    end
    
    add_foreign_key :banks, :customers
    add_index :banks, :bk_name
    add_index :banks, :office
    add_index :banks, :account
    add_index :banks, :bk_name_check
    add_index :banks, :office_check
    add_index :banks, :account_check
  end
end
