template ".gitconfig" do
  path "/home/#{node['ruby-env']['user']}/.gitconfig"
  source ".gitconfig.erb"
  user   node['ruby-env']['user']
  group  node['ruby-env']['group']
  mode "0644"
  not_if { File.exists?("/home/#{node['ruby-env']['user']}/.gitconfig") }
end
