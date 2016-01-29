%w{mariadb-server mariadb-devel redis}.each do |pkg|
  package pkg do
    action :install
  end
end

template "server.cnf" do
  path '/etc/my.cnf.d/server.cnf'
  source "server.cnf"
  owner "root"
  group "root"
  mode "0644"
end

service "mariadb" do
  action [:start, :enable]
end
