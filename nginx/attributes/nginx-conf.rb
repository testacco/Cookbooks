node.default['nginx']['app_name'] = "tomcat"
node.default['nginx']['servers'] = ['10.0.0.21']
node.default['nginx']['service_name'] = "nginx"
node.default['nginx']['ssl_dir']="/etc/ssl"
node.default['nginx']['cert_dir']="#{node.default['nginx']['ssl_dir']}/nginx_selfsigned.crt"
node.default['nginx']['key_dir']="#{node.default['nginx']['ssl_dir']}/nginx_selfsigned.key"
node.default['nginx']['dhparam_dir']="#{node.default['nginx']['ssl_dir']}/dhparam.pem"
