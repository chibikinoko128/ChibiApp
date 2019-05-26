class CreatePays < ActiveRecord::Migration[5.1]
  def change
    create_table :pays do |t|
      t.integer :year, null: false, default: 2018
      t.integer :month, null: false, default: 1
      t.integer :quarter, null: false, default: 1
      
      t.timestamps
    end
  end
end
