class CreateAdminEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_events do |t|
      t.references :administrator, null: false  # 管理者レコードへの外部キー
      t.string :type, null: false              # イベントタイプ
      t.datetime :created_at, null: false      # 発生時刻
    end
    
    add_index :admin_events, :created_at
    add_foreign_key :admin_events, :administrators
  end
end
