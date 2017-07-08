#
# Cookbook:: httpd
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
execute 'yum_update' do
  command 'yum -y update'
end

yum_package 'java-1.8.0-openjdk-devel.x86_64' do
  action :install
end

yum_package 'wget' do
  action :install
end

yum_package 'git' do
  action :install
end

remote_file '/etc/yum.repos.d/jenkins.repo' do
  source 'http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo'
  owner 'ec2-user'
  group 'ec2-user'
  mode '0755'
  action :create
end
