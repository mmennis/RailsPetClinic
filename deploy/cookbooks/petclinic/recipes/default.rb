include_recipe "mysql::client"
include_recipe "mysql::server"
include_recipe "nginx::default"
include_recipe "monit::default"

%w(build-essential zlib1g-dev libssl-dev libreadline5-dev git-core libpcre3-dev ruby1.9 ruby-dev nginx).each do |prereq|
  package prereq
end

gem_package 'bundler'

app_root = '/web_apps/rails_pet_clinic'

directory app_root do
  recursive true
  action :create
  owner 'www-data'
  group 'www-data'
  mode '0755'
end

execute "dbsetup" do
  command "bundle install; bundle exec rake db:drop; bundle exec rake db:create; bundle exec rake db:migrate && bundle exec rake db:populate"
  cwd app_root
  environment('RAILS_ENV' => 'production')
  group 'www-data'
  user 'www-data'
  action :nothing
end

git app_root do
  repository "git://github.com/niralisse/RailsPetClinic.git"
  action :sync
  revision 'chef-solo'
  enable_submodules true
  user 'www-data'
  group 'www-data'
  notifies :run, 'execute[dbsetup]', :immediately
end

['tmp', 'tmp/pids', 'log'].each do |dir|
  directory File.join(app_root, dir) do
    action :create
    owner 'www-data'
    group 'www-data'
    mode '0755'
  end
end

template '/etc/init.d/unicorn' do
  source 'unicorn.init.erb'
  variables(:app_root => app_root)
  mode '0744'
end

template "#{node[:nginx][:dir]}/sites-available/petclinic" do
  source 'petclinic.erb'
  owner "root"
  group "root"
  mode '0644'
  variables(:app_root => app_root)
end

service 'unicorn' do
  action [:enable, :start]
  supports :restart => true
end

nginx_site 'petclinic'

monitrc  'nginx'
monitrc  'unicorn'
