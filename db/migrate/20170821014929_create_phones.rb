class CreatePhones < ActiveRecord::Migration[5.1]
  def change
    create_table :phones do |t|
      t.references :customer, null: false
      #t.integer :customer_id, null: false
      t.references :address
      t.string :number, null: false, default: "0"                   # 電話番号
      t.string :number_for_index, null: false         # 索引用電話番号
      t.boolean :primary, null: false, default: false # 優先フラグ

      t.timestamps
    end
    
    add_index :phones, :number_for_index
    add_foreign_key :phones, :customers
    add_foreign_key :phones, :addresses
  end
end
