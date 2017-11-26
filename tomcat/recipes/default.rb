
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


node['tomcat']['package_names'].each do |package_name|
  package package_name do
    action :install
  end
end

# tomcat.conf config
ruby_block "line" do
  block do
    file = Chef::Util::FileEdit.new("#{node['tomcat']['tomcat-conf_filepath']}")
    file.insert_line_if_no_match("/JAVA_OPTS/", "JAVA_OPTS=#{node['tomcat']['java_opts']}")
    file.write_file
  end
end

credentials = data_bag_item('tomcat_keys', 'credentials')

# tomcat-users.xml config
template node['tomcat']['tomcat-users_filepath'] do
  source 'tomcat-users.erb'
  variables ({
    :username => credentials['username'],
    :password => credentials['password']
  })
  action :create
end

node['tomcat']['services'].each do |service_name|
  service service_name do
    action [:enable, :start]
  end
end

remote_file node['tomcat']['tomcat_webapp'] do
  source node['tomcat']['url']
  action :create
end

