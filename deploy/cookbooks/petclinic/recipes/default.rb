include_recipe "mysql::client"
include_recipe "mysql::server"
include_recipe "nginx::default"
include_recipe "monit::default"

%w(build-essential zlib1g-dev libssl-dev libreadline5-dev git-core libpcre3-dev ruby1.9 ruby-dev nginx).each do |prereq|
  package prereq
end

app_root = '/web_apps/rails_pet_clinic'

directory app_root do
  action :create
  owner 'www-data'
  group 'www-data'
  mode '0755'
end

deploy app_root do
  repo "git://github.com/niralisse/RailsPetClinic.git"
  action :deploy
  revision 'master'
  enable_submodules true
  migrate true
  migration_command 'bundle exec rake db:migrate'
  environment "RAILS_ENV" => "production"
  restart_command 'monit restart unicorn'
  user 'www-data'
  group 'www-data'
end

template "#{node[:nginx][:dir]}/sites-available/petclinic" do
  source 'petclinic.erb'
  owner "root"
  group "root"
  mode 0644
end

template '/etc/init.d/unicorn' do
  source 'unicorn.init.erb'
  variables {:app_root => app_root}
end

service 'unicorn' do
  action [:enable, :start]
  supports :restart => true
end

nginx_site do
  name 'petclinic'
end

monitrc do
  name 'nginx'
end

monitrc do
  name 'unicorn'
end