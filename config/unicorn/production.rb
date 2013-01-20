worker_processes 8
timeout 30

listen 5000, tcp_nopush: true

preload_app true

working_directory "/home/hamster-entries/current"
pid "/home/hamster-entries/current/tmp/pids/unicorn.pid"

stderr_path "/home/hamster-entries/shared/log/unicorn.stderr.log"
stdout_path "/home/hamster-entries/shared/log/unicorn.stdout.log"

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end