mysql_service 'app' do
  charset "utf8mb4"
  version '5.6'
  action [:create, :start]
end
user 'social-dating' do
  action :create
end
