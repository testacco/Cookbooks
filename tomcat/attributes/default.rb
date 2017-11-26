#credentials = data_bag_item('tomcat_keys', 'credentials')

node.default['tomcat']['package_names'] = ['java-1.7.0-openjdk', 'tomcat', 'tomcat-webapps', 'tomcat-admin-webapps', 'tomcat-docs-webapp', 'tomcat-javadoc']
node.default['tomcat']['services'] = ['tomcat']
node.default['tomcat']['tomcat-conf_filepath'] = "/usr/share/tomcat/conf/tomcat.conf"
node.default['tomcat']['tomcat-users_filepath'] = "/usr/share/tomcat/conf/tomcat-users.xml"

node.default['tomcat']['war_name'] = "oms.war"
node.default['tomcat']['tomcat_webapp']="/usr/share/tomcat/webapps/#{node.default['tomcat']['war_name']}"
node.default['tomcat']['url'] = "http://deployment:deployment123@10.0.0.22:8081/nexus/content/repositories/snapshots/com/softserveinc/edu/1.0.0-BUILD-SNAPSHOT/edu-1.0.0-BUILD-20171106.135307-1.war"
#node.default['tomcat']['url']='http://deployment:deployment123@10.0.0.22:8081/nexus/content/repositories/redirect?r=snapshots&g=com.softserveinc&a=edu&v=LATEST/edu-1.0.0-BUILD.war'

node.default['tomcat']['tomcat_admin'] = "admin"
node.default['tomcat']['tomcat_password'] = "admin"
node.default['tomcat']['java_opts'] = "'-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xmx512m -XX:MaxPermSize=512m -XX:+UseConcMarkSweepGC'"
