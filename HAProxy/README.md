# HAProxy

TODO: Enter the cookbook description here.
===========

Installs haproxy and prepares the configuration location.

=======

## Cookbooks:

Attributes
==========

* `node['haproxy']['incoming_port']` - sets the port on which haproxy listens
* `node['haproxy']['member_port']` - the port that member systems will be listening on, default 80
* `node['haproxy']['enable_admin']` - whether to enable the admin interface. default true. Listens on port 22002.
* `node['haproxy']['app_server_role']` - used by the `app_lb` recipe to search for a specific role of member systems. Default `webserver`.
* `node['haproxy']['balance_algorithm']` - sets the load balancing algorithm; defaults to roundrobin.
* `node['haproxy']['member_max_connections']` - the maxconn value to be set for each app server
* `node['haproxy']['x_forwarded_for']` - if true, creates an X-Forwarded-For header containing the original client's IP address. This option disables KeepAlive.
* `node['haproxy']['enable_ssl']` - whether or not to create listeners for ssl, default false
* `node['haproxy']['ssl_member_port']` - the port that member systems will be listening on for ssl, default 8443
* `node['haproxy']['ssl_incoming_port']` - sets the port on which haproxy listens for ssl, default 443

Usage
=====

Use either the default recipe.

When using the default recipe, modify the haproxy.cfg.erb file with listener(s) for your sites/servers.
