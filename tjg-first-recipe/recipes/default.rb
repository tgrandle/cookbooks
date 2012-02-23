require_recipe "git"
# require_recipe "screen"
# require_recipe "apt"

# directory "/home/vagrant/hello-world" do
#   mode 0755
# end


# cookbook_file "/home/vagrant/foo.txt" do
#   source "foo.txt"
#   mode 0755
#   owner "vagrant"
#   group "vagrant"
# end

# directory "/home/vagrant/.ssh" do
#   mode 0700
# end
# 
cookbook_file "/home/vagrant/.ssh/github-id_rsa" do
  source "github-id_rsa"
  mode 0600
  owner "vagrant"
  group "vagrant"
end


cookbook_file "/home/vagrant/.ssh/github-id_rsa.pub" do
  source "github-id_rsa.pub"
  mode 0600
  owner "vagrant"
  group "vagrant"
end


cookbook_file "/home/vagrant/ssh_wrapper.sh" do
  source "ssh_wrapper.sh"
  mode 0700
  owner "vagrant"
  group "vagrant" 
end

git "/home/vagrant/small-scripts/" do
  repository "git@github.com:tgrandle/small-scripts.git"
  reference "master"
  action :sync
  ssh_wrapper "/home/vagrant/ssh_wrapper.sh"
end