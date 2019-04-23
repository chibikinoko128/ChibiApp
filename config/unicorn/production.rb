#ワーカーの数。後述
  $worker  = 2
#何秒経過すればワーカーを削除するのかを決める
  $timeout = 30
#自分のアプリケーション名、currentがつくことに注意。
  $app_dir = "/usr/share/nginx/html/current"
#リクエストを受け取るポート番号を指定。後述
  $listen  = File.expand_path 'tmp/sockets/.unicorn.sock', $app_dir
#PIDの管理ファイルディレクトリ
  $pid     = File.expand_path 'tmp/pids/unicorn.pid', $app_dir
#エラーログを吐き出すファイルのディレクトリ
  $std_log = File.expand_path 'log/unicorn.log', $app_dir

# 上記で設定したものが適応されるよう定義
  worker_processes  $worker
  working_directory $app_dir
  stderr_path $std_log
  stdout_path $std_log
  timeout $timeout
  listen  $listen
  pid $pid

#ホットデプロイをするかしないかを設定
  preload_app true

root = "/usr/share/nginx/html/current"

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{root}/Gemfile"
end


#fork前に行うことを定義。後述
  before_fork do |server, worker|
  # the following is highly recomended for Rails + "preload_app true"
  # as there's no need for the master process to hold a connection
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  # Before forking, kill the master process that belongs to the .oldbin PID.
  # This enables 0 downtime deploys.
  old_pid = "#{root}/tmp/pids/unicorn.pid.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

#fork後に行うことを定義。後述
  after_fork do |server, worker|
    defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
  end