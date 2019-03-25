class CreateTwentyFourMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :twenty_four_members do |t|
      t.integer :om_1, null: false, default: 0
      t.integer :om_2, null: false, default: 0
      t.integer :om_3, null: false, default: 0
      t.integer :om_4, null: false, default: 0
      t.integer :om_5, null: false, default: 0
      t.integer :om_6, null: false, default: 0
      t.integer :om_7, null: false, default: 0
      t.integer :om_8, null: false, default: 0
      t.integer :om_9, null: false, default: 0
      t.integer :om_10, null: false, default: 0
      t.integer :om_11, null: false, default: 0
      t.integer :om_12, null: false, default: 0
      t.timestamps
    end
  end
end
