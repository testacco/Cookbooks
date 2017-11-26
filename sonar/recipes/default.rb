

case node["platform"]

  when "centos","ubuntu","redhat"
      remote_file "/opt/sonar-6.5.zip" do
          source "https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-6.5.zip"
          mode "0644"
          not_if {File.exists?("/opt/sonar-6.5.zip")}
      end

      execute "unzip" do 
          user "root"
          group "root"
          cwd "/opt"
          action :run
          command "unzip SonarQube-6.5.zip"
          not_if { ::File.directory?("/opt/sonarqube-6.5}") }
      end


    service "sonar" do
        stop_command "bash /opt/sonarqube-6.5/bin/#{node['sonar']['os_kernel']}/sonar.sh stop"
        start_command "bash /opt/sonarqube-6.5/bin/#{node['sonar']['os_kernel']}/sonar.sh start"
        status_command "bash /opt/sonarqube-6.5/bin/#{node['sonar']['os_kernel']}/sonar.sh status"
        restart_command "bash /opt/sonarqube-6.5/bin/#{node['sonar']['os_kernel']}/sonar.sh restart"
        action :start
      end

    

end