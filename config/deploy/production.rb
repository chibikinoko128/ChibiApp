# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

# server "example.com", user: "deploy", roles: %w{app db web}, my_property: :my_value
# server "example.com", user: "deploy", roles: %w{app web}, other_property: :other_value
# server "db.example.com", user: "deploy", roles: %w{db}



# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

# role :app, %w{deploy@example.com}, my_property: :my_value
# role :web, %w{user1@primary.com user2@additional.com}, other_property: :other_value
# role :db,  %w{deploy@example.com}



# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.



# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# The server-based syntax can be used to override options:
# ------------------------------------
# server "example.com",
#   user: "user_name",
#   roles: %w{web app},
#   ssh_options: {
#     user: "user_name", # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: "please use keys"
#   }
#set :puma_bind,       "unix://#{shared_path}/tmp/sockets/puma.sock"
#set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
#set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
#set :puma_access_log, "#{release_path}/log/puma.access.log"
#set :puma_error_log,  "#{release_path}/log/puma.error.log"
#set :puma_preload_app, true
#set :puma_worker_timeout, nil
#set :puma_init_active_record, true

set :stage, :production
set :rails_env, 'production'
 
set :branch, 'master'
 
set :migration_role, 'db'

#set :puma_init_active_record, true
 
# server-based syntax

#server 'wonder-gate.com',
  #user: 'kinoko',
  #roles: %w{web db app},
  #ssh_options: {
    #port: 60128,
    #user: 'kinoko',
  #keys: %w(/home/kinoko/.ssh/id_rsa),
    #keys: %w(~/.ssh/id_rsa),
  #keys: [File.expand_path('~/.ssh/id_rsa')],
    #forward_agent: true,
    #auth_methods: %w(publickey)
role :app, %w{kinoko@153.126.131.89}
role :web, %w{kinoko@153.126.131.89}
role :db,  %w{kinoko@153.126.131.89}
server '153.126.131.89', user: 'kinoko', roles: %w{app web db}
#role :app, %w{kinoko@wonder-gate.com}
#role :web, %w{kinoko@wonder-gate.com}
#role :db, %w{kinoko@wonder-gate.com}

set :ssh_options, {
  port: 60128,
  #keys: [File.expand_path('~/.ssh/id_rsa')],
  #keys: %w(/home/vagrant/.ssh/id_rsa),
  keys: %w(/home/vagrant/chibi/chibi/.ssh/id_rsa),
  forward_agent: true,
  auth_methods: %w(publickey)
}