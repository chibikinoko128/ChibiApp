class CreateChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :choices do |t|
      t.integer :detection, null: false, default: 0
      t.string :remuneration, null: false, default: "キャッシュバック"
      t.timestamps
    end
  end
end
