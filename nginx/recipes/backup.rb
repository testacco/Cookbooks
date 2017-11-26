#
# Cookbook:: nginx
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# installing required packages
#['epel-release', 'nginx'].each do |pack|
#  package pack do 
#    action :install
#  end
#end

# for centos
template '/etc/yum.repos.d/nginx.repo' do
  source 'nginx_repo.erb'
  action :create
end

package 'nginx' do
  action :install
end

#package 'firewalld' do
#  action :install
#end

#service 'firewalld' do
#  action [ :start, :enable ]
#end

# starting service
#service "nginx" do
#  action [ :start, :enable ]
#end

# setting firewall rules
#firewall 'default'
#firewall 'default' do 
#  action :install
#end

#firewall_rule 'http' do
#  protocol :tcp
#  port [80, 8080]
#  command :allow
  
#end

#firewall_rule node['ipaddr'] do
#  protocol :tcp
#  direction :pre
#  command :redirect
#  port 80
#  redirect_port 8080
#end

#firewalld_service 'http' do
#  action :add
#  zone 'public'
#end

#firewalld_port '8080/tcp' do
#  action :add
#  zone 'public'
#end

#firewalld_masquerade 'add masquerading to public zone' do
#  action :add
#  zone 'public'
#end

#execute "redirect_port" do
#  command "firewall-cmd --permanent --add-forward-port=port=80:proto=tcp:toport=8080"
#  #command "firewall-cmd --permanent --add-rule ipv4 nat OUTPUT 1 -p tcp -d 
#end


#firewalld_rich_rule 'redirect_port' do
#  port_number '80'
#  forward_port '8080'
#  zone 'public'
#  port_protocol 'tcp'
#  action :add
#end

#keys = data_bag('nginx_keys')
#nginx_key = data_bag_item('keys')

# creating config file for balancing
template "/etc/nginx/conf.d/load_balancer.conf" do
  source "load_balancer.erb"
  variables({
    :ip_server => node['nginx']['servers'],
    :app_name => node['nginx']['app_name']
  })
  action :create
end

file '/etc/nginx/conf.d/default.conf' do
  action :delete
end

#service "firewalld" do 
#  action :restart
#end

service "nginx" do
  action [:enable, :start]
end
