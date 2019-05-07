# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "chibi"
set :rails_env, "production"
set :repo_url, "https://github.com/chibikinoko128/ChibiApp.git"
set :branch, 'master'
set :conditionally_migrate, true

#set :scm, :git
#server 'wonder-gate.com', user: 'kinoko', port: 60128, roles: %w{web app db}
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :user,            'kinoko'
#set :puma_threads,    [4, 16]
#set :puma_workers,    0
set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/usr/share/nginx/html"
set :format, :pretty
set :log_level, :debug
set :keep_releases, 5
#set :puma_bind,       "unix://#{shared_path}/tmp/sockets/puma.sock"
#set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
#set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
#set :puma_access_log, "#{release_path}/log/puma.access.log"
#set :puma_error_log,  "#{release_path}/log/puma.error.log"
#set :puma_preload_app, true
#set :puma_worker_timeout, nil
#set :puma_init_active_record, true
set :rbenv_type, :user
#set :rbenv_path, '/home/vagrant/.rbenv'
set :rbenv_ruby_version, 'ruby_2.3.1'
set :rbenv_custom_path, '/home/kinoko/.rbenv'
#set :chruby_ruby, 'ruby-2.3.1p112'
#set :rvm_ruby_version, "ruby-2.3.1"

#set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
#set :rbenv_map_bins, %w{rake gem bundle ruby rails}
#set :rbenv_roles, :all

set :linked_dirs, fetch(:linked_dirs, []).push(
  'log',
  'tmp/pids',
  'tmp/cache',
  'tmp/sockets',
  'vendor/bundle',
  'public/system',
  'public/uploads',
  'public/tmp',
  #'db'
)
set :linked_files, fetch(:linked_files, []).push(
  'config/database.yml',
  'config/secrets.yml',
  #'.env'
)
set :whenever_identifier, -> { "#{fetch(:application)}_#{fetch(:stage)}" }
set :whenever_roles,        ->{ :batch }

#set :unicorn_pid, "/usr/share/nginx/html/current/tmp/pids/unicorn.pid"
#set :unicorn_config_path, "/usr/share/nginx/html/current/config/unicorn/production.rb"
#set :unicorn_rack_env, 'production'

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end

  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          sql = "CREATE DATABASE IF NOT EXISTS chibi_production;"
          execute "mysql --user=root --password=1130kinoko -e '#{sql}'"
          #execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end


#namespace :maintenance do
  #desc 'start maintenance'
  #task :on do
    #on roles(:web) do
      #target_dir = "#{shared_path}/public/tmp"
      #target_path = "#{target_dir}/maintenance.html"
      #source_path = "#{release_path}/public/maintenance.html"
      #execute :mkdir, '-p', target_dir
      #execute :cp, '-f', source_path, target_path
    #end
  #end

  #desc 'stop maintenance'
  #task :off do
    #on roles(:web) do
      #target = "#{shared_path}/public/tmp/maintenance.html"
      #execute :rm, target if test "[ -f #{target} ]"
    #end
  #end
#end

#namespace :deploy do
  #desc 'Upload database.yml'
  #task :upload do
    #on roles(:app) do |host|
      #if test "[ ! -d #{shared_path}/config ]"
        #execute "mkdir -p #{shared_path}/config"
      #end
      #upload!('config/database.yml', "#{shared_path}/config/database.yml")
    #end
  #end
  
  #desc 'Make sure local git is in sync with remote.'
  #task :check_revision do
    #on roles(:app) do
      #unless `git rev-parse HEAD` == `git rev-parse origin/master`
      #end
    #end
  #end

  #desc 'Initial Deploy'
  #task :initial do
    #on roles(:app) do
      #before 'deploy:restart', 'puma:start'
      #invoke 'deploy'
    #end
  #end

  #desc 'Restart application'
  #task :restart do
    #invoke 'unicorn:restart'
  #end

  #desc 'reload the database with seed data'
  #task :seed do
    #on roles(:db) do
      #with rails_env: fetch(:rails_env) do
        #within release_path do
          #execute :bundle, :exec, :rake, 'db:seed'
        #end
      #end
    #end
  #end
  
  #after  :migrate,      :seed
  #before :starting,     :check_revision
  #after  :finishing,    :compile_assets
  #after  :finishing,    :cleanup
#end

#before 'deploy:starting', 'deploy:upload'
#after 'deploy:publishing', 'deploy:restart'

#require "capistrano/maintenance"
#set :maintenance_template_path, File.join(File.dirname(__FILE__), "..", "app", "views", "system", "maintenance.html.erb")
#$VERBOSE = nil

#namespace :db do
  #desc "Dump the database and compress it."
  #task :backup do
    #on roles(:db) do
  
      #backups_path = "#{shared_path}/db_backups"

      #date = capture "cat #{current_path}/config/database.yml"
      #config = YAML::load(data)[rails_env]
      #abort unless config && config['adapter'] == 'mysql2'

      #file_name = "#{config['database']}-#{release_name}.sql.gz"

      #command = "/usr/bin/mysqldump --user=#{config['username']}"
      #command += " --password" if config['password']
      #command += " --host=#{config['host']}" if config['host']
      #command += " --port=#{config['port']}" if config['port']
      #command += " #{config['database']}"
      #command += " | gzip -c > #{backups_path}/#{file_name}"

      #run "mkdir -p #{backups_path}"
      #run command do |channel, _, output|
        #if output =~ /^Enter password:/
          #channel.send_data "#{config['password']}n"
        #end
      #end
    #end
  #end
#end

#Rake::Task["deploy:new_release_path"].clear

#namespace :deploy do
  #task :new_release_path do
    #set_release_path(Time.now.strftime("%Y%m%d%H%M%S"))
  #end
#end