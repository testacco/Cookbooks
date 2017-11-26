#
# Cookbook:: nexus
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe "java"

directory node['nexus']['app_dir'] do
  action :create
end

# untar tar file
tar_extract node['nexus']['download_url'] do
  target_dir node['nexus']['app_dir']
  action :extract
  creates node['nexus']['untar_dir']
end

ruby_block "line" do
  block do
    file = Chef::Util::FileEdit.new("#{node['nexus']['nexus_script']}")
    file.search_file_replace_line("^#RUN_AS_USER=$", "#{node['nexus']['insert_user']}")
    file.write_file
  end
end

# create symbolic link
link node['nexus']['service_dir'] do 
  to node['nexus']['nexus_script']
  link_type :symbolic
  action :create
end

# start service
service 'nexus' do
  action [ :enable, :start ]
end

