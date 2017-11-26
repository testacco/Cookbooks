#
# Cookbook Name:: haproxy
# Default:: default

default['haproxy']['incoming_port'] = "80"
default['haproxy']['member_port'] = "8080"
default['haproxy']['enable_admin'] = true
default['haproxy']['app_server_role'] = "webserver"
default['haproxy']['balance_algorithm'] = "roundrobin"
default['haproxy']['member_max_connections'] = "100"
default['haproxy']['x_forwarded_for'] = false
default['haproxy']['enable_ssl'] = false
default['haproxy']['ssl_incoming_port'] = "443"
default['haproxy']['ssl_member_port'] = "8443"
