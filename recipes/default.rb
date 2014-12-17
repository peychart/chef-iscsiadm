#
# Cookbook Name:: chef-iscsiadm
# Recipe:: default
#
# Copyright (C) 2014 PE, pf.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
if node['chef-iscsiadm']

  package 'open-iscsi' do
    package_name 'open-iscsi'
    action Array.new( node['chef-iscsiadm']['portal'] ).empty? ? :nothing : :upgrade
  end

  service 'iscsiadm' do
    supports :status => true, :restart => false, :reload => false
  end

  template '/etc/init.d/iscsiadm' do
    source 'iscsiadm.erb'
    mode '0755'
    owner 'root'
    group 'root'
    variables({
      :date => Time.now,
      :portal => node['chef-iscsiadm']['portal']
    })
    action Array.new( node['chef-iscsiadm']['portal'] ).empty? ? :delete : :create
    notifies :start, 'service[iscsiadm]', :immediately
  end

end
