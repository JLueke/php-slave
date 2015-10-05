include_recipe 'apache2::default'
include_recipe 'php'
include_recipe 'apache2::mod_php5'

template "#{node['apache']['dir']}/sites-available/default.conf" do
  source   'default.conf.erb'
  owner    'root'
  group    node['apache']['root_group']
  mode     '0644'
  notifies :restart, 'service[apache2]'
end

apache_site 'default' do
  enable true
end

package "php5-xdebug" do
  action :install
end

# add explicit connection setup
template "/etc/php5/apache2/conf.d/xdebug_local.ini" do
  source "xdebug_local.ini"
  owner "root"
  group "root"
  mode 00755
end

