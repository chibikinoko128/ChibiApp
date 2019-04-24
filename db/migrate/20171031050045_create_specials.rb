class CreateSpecials < ActiveRecord::Migration[5.1]
  def change
    create_table :specials do |t|
      t.references :customer, null: false            # 顧客への外部キー
      #t.integer :customer_id, null: false
      t.integer :basic, null: false, default: 0      # ベーシック
      t.integer :crystal, null: false, default: 0    # クリスタル
      t.integer :silver, null: false, default: 0     # シルバーベーシック
      t.integer :gold, null: false, default: 0       # ゴールドベーシック
      t.integer :platinum, null: false, default: 0   # プラチナベーシック
      t.integer :pegasus, null: false, default: 0    # ペガサス
      t.integer :phoenix, null: false, default: 0    # フェニックス
      t.integer :queen, null: false, default: 0      # クイーン
      t.integer :king, null: false, default: 0       # キング
      t.integer :president, null: false, default: 0  # プレジデント
      
      t.timestamps
    end
    
    add_foreign_key :specials, :customers
    add_index :specials, :basic
    add_index :specials, :crystal
    add_index :specials, :silver
    add_index :specials, :gold
    add_index :specials, :platinum
    add_index :specials, :pegasus
    add_index :specials, :phoenix
    add_index :specials, :queen
    add_index :specials, :king
    add_index :specials, :president
  end
end
