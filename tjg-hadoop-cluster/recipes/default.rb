cookbook_file "/home/vagrant/.ssh/id_rsa" do
	source "vagrant"
	group "root"
	owner "vagrant"
	mode "600"
end
cookbook_file "/home/vagrant/.ssh/id_rsa.pub" do
	source "vagrant.pub"
	group "root"
	owner "vagrant"
	mode "644"
end

script "ssh_setup" do
	not_if "test -d /home/vagrant/hadoop-0.20.203.0"
	interpreter "bash"
	user "root"
	cwd "/"
	code <<-EOH
	echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
	EOH
end

# script "ssh_key" do
# 	not_if "test -f /home/vagrant/.ssh/authorized_key"
# 	interpreter "bash"
# 	user "vagrant"
# 	cwd "/home/vagrant"
# 	code <<-EOH
# 	cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys	
# 	EOH
# end

script "hadoop_setup" do
  not_if "test -d /home/vagrant/hadoop-0.20.203.0"
  interpreter "bash"
  user "vagrant"
  cwd "/home/vagrant"
  code <<-EOH
  
  cp /home/vagrant/share/hadoop-0.20.203.0rc1.tar.gz /home/vagrant/
  tar -zxvf hadoop-0.20.203.0rc1.tar.gz
  
  EOH
end

cookbook_file "/home/vagrant/hadoop-0.20.203.0/conf/hadoop-env.sh" do
	source "hadoop-env.sh"
	group "root"
	owner "vagrant"
	mode "644"
end

cookbook_file "/home/vagrant/hadoop-0.20.203.0/conf/slaves" do
	source "slaves"
	group "root"
	owner "vagrant"
	mode "644"
end

cookbook_file "/home/vagrant/hadoop-0.20.203.0/conf/core-site.xml" do
	source "core-site.xml"
	group "root"
	owner "vagrant"
	mode "644"
end

cookbook_file "/home/vagrant/hadoop-0.20.203.0/conf/hdfs-site.xml" do
	source "hdfs-site.xml"
	group "root"
	owner "vagrant"
	mode "644"
end

cookbook_file "/home/vagrant/hadoop-0.20.203.0/conf/mapred-site.xml" do
	source "mapred-site.xml"
	group "root"
	owner "vagrant"
	mode "644"
end