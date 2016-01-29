file '/etc/sudoers' do
  owner 'root'
  group 'root'
  content 'vagrant ALL=(ALL)   NOPASSWD:ALL\n'
end
