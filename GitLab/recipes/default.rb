#
# Cookbook:: GitLab
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved

package 'curl'
package 'openssh-server'
service 'sshd' do
action [:enable, :start]
end

#firewall-cmd --permanent --add-service=http
service 'firewalld' do 
action [:reload]
end


package 'postfix'
service 'postfix' do
action [:enable, :start]
end


