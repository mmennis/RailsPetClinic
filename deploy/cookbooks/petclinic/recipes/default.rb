include_recipe "mysql::client"
include_recipe "mysql::server"
include_recipe "nginx::default"
include_recipe "monit::default"

%w(build-essential zlib1g-dev libssl-dev libreadline5-dev git-core libpcre3-dev ruby1.9 ruby-dev nginx).each do |prereq|
  package prereq
end

gem_package 'bundler'

app_root = '/web_apps/rails_pet_clinic'

directory "#{app_root}/shared" do
  recursive true
  action :create
  owner 'www-data'
  group 'www-data'
  mode '0755'
end

deploy app_root do
  repo "git://github.com/niralisse/RailsPetClinic.git"
  action :deploy
  # no symlinks, we store production config in the repo
  symlink_before_migrate({})
  revision 'master'
  enable_submodules true
  migrate true
  # nuke everything all the time
  migration_command 'bundle install; bundle exec rake db:drop; bundle exec rake db:create; bundle exec rake db:migrate && bundle exec rake db:populate'
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
  variables(:app_root => app_root)
end

service 'unicorn' do
  action [:enable, :start]
  supports :restart => true
end

nginx_site 'petclinic'

monitrc  'nginx'
monitrc  'unicorn'
