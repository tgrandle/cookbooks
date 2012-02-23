# Run apt-get update before the chef convergence stage
r = execute "apt-get update" do
  user "root"
  command "apt-get update"
  action :nothing
end
r.run_action(:run)

require_recipe "screen"
require_recipe "git"
#require_recipe "apt"
#require_recipe "rvm"

package "curl"
package "git-core"
include_recipe "build-essential"
 
# %w(libreadline5-dev zlib1g-dev libssl-dev libxml2-dev libxslt1-dev).each do |pkg|
#   package pkg
# end
#  
# bash "installing system-wide RVM stable" do
#   user "root"
#   code "bash < <( curl -L https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )"
#   not_if "which rvm"
# end
# 
# script "install_something" do
#   	interpreter "bash"
# 	user "root"
#    cwd "/home/vagrant"
#    code <<-EOH
# 
#  	rvm get latest
#  	rvm reload
#  	sudo rvm install ruby-1.9.2
#  	rvm --default use ruby-1.9.2
#  	sudo gem update --system
#  	sudo rvm ruby-1.9.2-p290@rails311 --create --default
#  	sudo gem update rake
#  	sudo apt-get install sqlite3 libsqlite3-dev
#  	sudo gem install rails
#    EOH
# end