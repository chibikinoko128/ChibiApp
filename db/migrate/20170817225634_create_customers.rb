class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :email, null: false            # メールアドレス
      t.string :email_for_index, null: false  # 索引用メールアドレス
      t.string :family_name, null: false      # 姓
      t.string :given_name, null: false       # 名
      t.string :family_name_kana, null: false # 姓（カナ）
      t.string :given_name_kana, null: false  # 名（カナ）
      t.string :nickname, null: false         # ニックネーム
      t.string :gender                        # 性別
      t.date :birthday                        # 誕生日
      t.string :hashed_password               # パスワード
      t.string :sponsor1, null: false, default: 'sss'  # 紹介者
      t.string :member_type, null: false, default: '一般会員'
      t.string :lock, null: false, default: "0"
      t.string :bonus_lock, null: false, default: "0"
      t.string :special_lock, null: false, default: "0"
      t.integer :new_register, null: false, default: 0

      t.timestamps
    end
    
    add_index :customers, :email_for_index, unique: true
    add_index :customers, :nickname, unique: true
    add_index :customers, [ :family_name_kana, :given_name_kana ]
    add_index :customers, :sponsor1
    add_index :customers, :member_type
    add_index :customers, :new_register
  end
end
