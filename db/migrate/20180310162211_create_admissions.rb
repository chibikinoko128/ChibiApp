class CreateAdmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :admissions do |t|
      t.string :entries_year, null: false, default: "2018"
      t.string :entries_month, null: false, default: "03"
      t.string :entries_day, null: false, default: "10"
      t.timestamps
    end
  end
end
