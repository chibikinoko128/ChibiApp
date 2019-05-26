common_table_names = %w(hash_locks)
common_table_names.each do |table_name|
  path = Rails.root.join('db', 'seeds', "#{table_name}.rb")
  if File.exist?(path)
    puts "Creating #{table_name}...."
    require(path)
  end
end

table_names = %w(staff_members administrators staff_events customers
  programs entries messages banks registers scores sponsors points members specials seventeens eighteens nineteens twenties ones twenty_two twenty_three twenty_four twenty_five twenty_six twenty_seven commissions admin_events)
table_names.each do |table_name|
  path = Rails.root.join('db', 'seeds', Rails.env, "#{table_name}.rb")
  if File.exist?(path)
    puts "Creating #{table_name}...."
    require(path)
  end
end
