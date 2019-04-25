class CreateCommissions < ActiveRecord::Migration[5.1]
  def change
    create_table :commissions do |t|
      t.string :pay_bank, null: false
      t.string :bank_name, null: false, default: "abc銀行"
      t.integer :fee_low, null: false, default: 0
      t.integer :fee_high, null: false, default: 0

      t.timestamps
    end
    
    #add_index :commissions, :pay_bank, unique: true
  end
end
