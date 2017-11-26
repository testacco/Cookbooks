#
# Cookbook:: sonarqube
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

case node["platform"]

	when "centos", "redhat", "ubuntu"
		remote_file "/opt/SonarQube-6.5.zip" do 
			source "https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-6.5.zip"
			action :create_if_missing
			mode 00644
		end

		package "java-1.7.0-openjdk-devel" do
 		 	action :install
		end
		package "unzip" do
			action :install
		end
		execute"unzip" do
			user "root"
			group "root"
			cwd "/opt"
			action :run
			command "unzip SonarQube-6.5.zip"
			not_if{ ::File.directory?("/opt/sonarqube-6.5") }
		end

		execute "bash" do
			user "root"
			group "root"
			cwd "/opt/sonarqube-6.5/bin/linux-x86-64"
			action :run
			command "bash sonar.sh start"
		end

	when "windows"
		remote_file "C:\SonarQube-6.5.zip" do
			source "https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-6.5.zip"
			action :create_if_missing
			rights :full_control
		end

		windows_zipfile "C:\SonarQube-6.5" do
			source "C:\SonarQube-6.5.zip"
			action :unzip
		end

		execute "start" do
			cwd "C:\SonarQube-6.5"
			command "C:\SonarQube-6.5\bin\windows-x86-64\InstallNTService.bat"
		end

end





