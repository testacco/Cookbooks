#
# Cookbook:: nginx
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# installing required packages
template '/etc/yum.repos.d/nginx.repo' do
  source 'nginx_repo.erb'
  action :create
end

package node['nginx']['service_name'] do
  action :install
end

# accessing databag
ssl = data_bag_item('nginx_keys', 'keys')

# create file for ssl certificate
file node['nginx']['cert_dir'] do 
  content ssl['ssl_cert']
  action :create
end

# create file for ssl certificate key
file node['nginx']['key_dir'] do
  content ssl['ssl_cert_key']
  action :create
end

# create file for dhparam
file node['nginx']['dhparam_dir'] do
  content ssl['ssl_dhparam']
  action :create
end

# define tomcat ip addresses
tomcat_servers = Array.new
results = search(:node, "name:tomcat*")
results.each do |node|
  tomcat_servers.push(node["ipaddress"])
end

# creating config file for balancing
template "/etc/nginx/conf.d/load_balancer.conf" do
  source "load_balancer.erb"
  variables({
    :ip_server => tomcat_servers,
    :app_name => node['nginx']['app_name'],
    :ssl_cert => node['nginx']['cert_dir'],
    :ssl_cert_key => node['nginx']['key_dir'],
    :ssl_dhparam => node['nginx']['dhparam_dir']
  })
  action :create
end

# deleting old config file
file '/etc/nginx/conf.d/default.conf' do
  action :delete
end

execute 'allow_connection' do
  command 'setsebool -P httpd_can_network_connect 1'
end

service node['nginx']['service_name'] do
  action [:enable, :start]
end
