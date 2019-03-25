class CreateRetrievals < ActiveRecord::Migration[5.1]
  def change
    create_table :retrievals do |t|
      t.integer :year, null: false, default: 2018
      t.integer :month, null: false, default: 1
      t.string :item, null: false, default: "企業実績" 
      t.timestamps
    end
  end
end
