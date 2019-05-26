class CreateNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :numbers do |t|
      t.string :entries_month, null: false, default: "01"
      t.string :entries_week, null: false, default: "1"
      t.string :entries_day, null: false, default: "1"

      t.timestamps
    end
  end
end
