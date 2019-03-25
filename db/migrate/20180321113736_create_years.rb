class CreateYears < ActiveRecord::Migration[5.1]
  def change
    create_table :years do |t|
      t.integer :year_check, null: false, default: 2018
      
      t.timestamps
    end
  end
end
