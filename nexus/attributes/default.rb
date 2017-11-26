
node.default['nexus']['nexus_user']="root"
node.default['nexus']['nexus_version']="nexus-2.14.5-02"
node.default['nexus']['download_url'] = "http://download.sonatype.com/nexus/oss/#{node.default['nexus']['nexus_version']}-bundle.tar.gz"

node.default['nexus']['app_dir']="/app"
node.default['nexus']['nexus_home']="#{node.default['nexus']['app_dir']}/#{node.default['nexus']['nexus_version']}"
node.default['nexus']['untar_dir']="#{node.default['nexus']['app_dir']}/nexus"
node.default['nexus']['nexus_script']="#{node.default['nexus']['nexus_home']}/bin/nexus"

node.default['nexus']['service_dir']="/etc/init.d/nexus"

node.default['nexus']['insert_user']="RUN_AS_USER=\"#{node.default['nexus']['nexus_user']}\""
