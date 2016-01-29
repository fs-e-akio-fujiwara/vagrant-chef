bash 'add vagrant sudoers' do
  not_if %!grep "vagrant" /etc/sudoers!
  code <<-EOC
    echo 'vagrant ALL=(ALL)   NOPASSWD:ALL' >> /etc/sudoers
  EOC
end
