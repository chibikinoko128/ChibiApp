class CreateStaffQuarters < ActiveRecord::Migration[5.1]
  def change
    create_table :staff_quarters do |t|
      t.string :bonus_year, null: false, default: "2018"
      t.string :bonus_quarter, null: false, default: "1"

      t.timestamps
    end
  end
end
