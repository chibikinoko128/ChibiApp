class CreateCustomerYears < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_years do |t|
      t.references :customer, null: false               # 顧客への外部キー
      #t.integer :customer_id, null: false
      t.integer :year_check, null: false, default: 2018

      t.timestamps
    end
    add_index :customer_years, :year_check
  end
end
