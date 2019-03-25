class ChangeCollations < ActiveRecord::Migration[5.1]
  def up
    if ActiveRecord::Base.connection.adapter_name == "Mysql2"
      ActiveRecord::Base.connection.tables.each do |table|
        execute(%Q{
          ALTER TABLE messages CONVERT TO CHARACTER SET utf8
            COLLATE utf8_general_ci
        })
      end
    end
  end

  def down
    if ActiveRecord::Base.connection.adapter_name == "Mysql2"
      ActiveRecord::Base.connection.tables.each do |table|
        execute(%Q{
          ALTER TABLE messages CONVERT TO CHARACTER SET utf8
            COLLATE utf8_unicode_ci
        })
      end
    end
  end
end
