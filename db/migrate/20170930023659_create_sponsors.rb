class CreateSponsors < ActiveRecord::Migration[5.1]
  def change
    create_table :sponsors do |t|
      t.references :customer, null: false                 # 顧客への外部キー
      #t.integer :customer_id, null: false
      t.string :sponsor1, null: false, default: "dragon"  # 紹介者1
      t.string :sponsor2, null: false, default: "dragon"  # 紹介者1
      t.string :sponsor3, null: false, default: "dragon"  # 紹介者1
      t.string :sponsor4, null: false, default: "dragon"  # 紹介者1
      t.string :sponsor5, null: false, default: "dragon"  # 紹介者1
      t.string :sponsor6, null: false, default: "dragon"  # 紹介者1
      t.string :sponsor7, null: false, default: "dragon"  # 紹介者1

      t.timestamps
    end
    
    add_index :sponsors, :sponsor1
    add_index :sponsors, :sponsor2
    add_index :sponsors, :sponsor3
    add_index :sponsors, :sponsor4
    add_index :sponsors, :sponsor5
    add_index :sponsors, :sponsor6
    add_index :sponsors, :sponsor7 
  end
end
