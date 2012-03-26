app_path = "/web_apps/rails_pet_clinic/"

working_directory app_path
listen "/tmp/rails_pet_clinic.socket", :backlog => 64
user 'www-data', 'www-data'

worker_processes 3


stderr_path "#{app_path}/log/unicorn.stderr.log"
stdout_path "#{app_path}/log/unicorn.stdout.log"

pid "#{app_path}/tmp/pids/unicorn.pid"
stdout_path ="/tmp/unicorn.stdout.log"
stderr_path ="/tmp/unicorn.stderr.log"


preload_app true
timeout 30

before_fork do |server, worker|
# This option works in together with preload_app true setting
# What is does is prevent the master process from holding
# the database connection
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
# Here we are establishing the connection after forking worker
# processes
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
