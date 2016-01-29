%w{mariadb-server mariadb-devel redis}.each do |pkg|
  package pkg do
    action :install
  end
end

service "mariadb" do
  action [:start, :enable]
end
