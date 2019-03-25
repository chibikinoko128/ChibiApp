# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

#set :bundle exec whenever
#set :crontab -l
#set :bundle exec whenever--update-crontab RAILS_ENV=production
#set :whenever_environment, :production

set :output, 'log/crontab.log'
#ENV['RAILS_ENV'] ||= 'development'
ENV['RAILS_ENV'] ||= 'production'
set :environment, ENV['RAILS_ENV']

#set :environment, "development"
set :environment, "production"

every 1.day, at: '0:25 am' do
  runner "Yesterday.introduction"
end

every 1.day, at: '0:30 am' do
  runner "PeopleNext.my_member"
end

every 1.hours do
  runner "Series.introduction"
end

every 2.hours do
  runner "Total.my_score"
end

every 3.hours do
  runner "Assemble.my_point"
end

every 4.hours do
  runner "People.my_member"
end

every '5 0 1 1 *' do
  runner "Total.my_score"
end

every '10 0 1 1 *' do
  runner "Assemble.my_point"
end

every '20 0 1 1 *' do
  runner "People.my_member"
end

every '29 0 1 1 *' do
  runner "Benefits.my_special"
end

every '5 0 1 4 *' do
  runner "Total.my_score"
end

every '10 0 1 4 *' do
  runner "Assemble.my_point"
end

every '20 0 1 4 *' do
  runner "People.my_member"
end

every '29 0 1 4 *' do
  runner "Benefits.my_special"
end

every '5 0 1 7 *' do
  runner "Total.my_score"
end

every '10 0 1 7 *' do
  runner "Assemble.my_point"
end

every '20 0 1 7 *' do
  runner "People.my_member"
end

every '29 0 1 7 *' do
  runner "Benefits.my_special"
end

every '5 0 1 10 *' do
  runner "Total.my_score"
end

every '10 0 1 10 *' do
  runner "Assemble.my_point"
end

every '20 0 1 10 *' do
  runner "People.my_member"
end

every '29 0 1 10 *' do
  runner "Benefits.my_special"
end

every '1 15 10 * *' do
  runner "CheckMail.thanks_to_all"
end

every '2 15 20 * *' do
  runner "CheckMail.thanks_to_all"
end

every '3 15 27 * *' do
  runner "CheckMail.thanks_to_all"
end

every '4 15 20 * *' do
  runner "BankMail.absence_registration"
end

every '30 10 6 * *' do
  runner "ExitEmail.email_clear"
end

every '37 0 1 * *' do
  runner "Performance.year_performance"
end

every '38 0 2 * *' do
  runner "Performance.year_performance"
end

every '39 0 3 * *' do
  runner "Performance.year_performance"
end

every '34 0 4 * *' do
  runner "Performance.year_performance"
end

every '33 0 5 * *' do
  runner "Performance.year_performance"
end

every '35 0 6 * *' do
  runner "Performance.year_performance"
end

every '15 0 1 * *' do
  runner "MonthRecord.member_count"
end

every '45 0 1 * *' do
  runner "User.owner_only"
end

every '46 0 6 * *' do
  runner "TotalMember.enrollment_member"
end

every '47 23 28 * *' do
  runner "SpecialMember.pt_special"
end

every '40 0 6 1 *' do
  runner "Assemble.point_reset"
end

every '41 0 6 1 *' do
  runner "People.member_reset"
end

every '42 0 6 1 *' do
  runner "Total.score_reset"
end

every '36 0 1 3 *' do
  runner "Benefits.special_reset"
end
