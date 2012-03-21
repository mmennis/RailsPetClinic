include_recipe "mysql::client"
include_recipe "mysql::server"
include_recipe "nginx::default"
include_recipe "monit::default"

%w(build-essential zlib1g-dev libssl-dev libreadline5-dev git-core libpcre3-dev ruby1.9 ruby-dev nginx).each do |prereq|
  package prereq
end

directory '/web_apps/rails_pet_clinic' do
  action :create
  owner 'www-data'
  group 'www-data'
  mode '0755'
end

git '/web_apps/rails_pet_clinic' do
  repository "git://github.com/niralisse/RailsPetClinic.git"
  action :sync
  revision 'master'
  user 'www-data'
  group 'www-data'
end

template "#{node[:nginx][:dir]}/sites-available/petclinic" do
  source 'petclinic.erb'
  owner "root"
  group "root"
  mode 0644
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
