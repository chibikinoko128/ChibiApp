class CreateStaffMonths < ActiveRecord::Migration[5.1]
  def change
    create_table :staff_months do |t|
      t.string :retrieval_year, null: false, default: "2018"
      t.string :retrieval_month, null: false, default: "03"

      t.timestamps
    end
  end
end
