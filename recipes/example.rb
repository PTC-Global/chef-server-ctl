#
# Cookbook Name:: chef-server-ctl
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'chef-server'
include_recipe 'chef-server::addons'

chef_server_user 'testuser' do
  firstname 'Test'
  lastname 'User'
  email 'testuser@example.com'
  password 'testuser'
  private_key_path '/tmp/testuser.pem'
  action :create
end

chef_server_org 'example' do
  org_long_name 'Example Organization'
  org_private_key_path '/tmp/example-validator.pem'
  action :create
end

chef_server_org 'example' do
  admins %w{ testuser }
  action :add_admin
end