app_path = "/web_apps/rails_pet_clinic"

working_directory app_path
listen "/tmp/rails_pet_clinic.socket", :backlog => 64
user 'www-data', 'www-data'

worker_processes 3
pid "/tmp/unicorn.pid"
stdout_path ="#{app_path}/log/unicorn.stdout.log"
stderr_path ="#{app_path}/log/unicorn.stderr.log"
