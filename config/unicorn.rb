app_path = "/webapp/rails_pet_clinic"

listen 3000

worker_processes 3
pid "#{app_path}/tmp/pids/unicorn.pid"
stdout_path ="#{app_path}/log/unicorn.stdout.log"
stderr_path ="#{app_path}/log/unicorn.stderr.log"
