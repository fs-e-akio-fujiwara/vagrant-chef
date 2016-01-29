# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.ssh.forward_agent = true
  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = false
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end

  config.vm.define :local_web do |local_web|
    local_web.vm.synced_folder ".", "/vagrant", disabled: true
    local_web.vm.hostname = "app"
    local_web.vm.box_url = "https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.1.0/centos-7.0-x86_64.box"
    local_web.vm.box = "centos7.0"
    local_web.vm.network "private_network", ip: "192.168.33.10"
    local_web.vm.network :forwarded_port, guest: 3000, host: 3000
    local_web.vm.network :forwarded_port, guest: 3000, host: 3001
    local_web.vm.network :forwarded_port, guest: 3000, host: 3002
    local_web.vm.network :forwarded_port, guest: 3000, host: 3003
    local_web.vm.network :forwarded_port, guest: 3000, host: 3004
    local_web.vm.network :forwarded_port, guest: 3000, host: 3005
    local_web.vm.network :forwarded_port, guest: 3000, host: 3006
    local_web.vm.network :forwarded_port, guest: 80,   host: 8080
    chef_web_setting(local_web, "development", {})
  end

end

def chef_web_setting config, environment, setting
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["./cookbooks", "./site-cookbooks"]
    chef.json = {
      nginx: {
        env: ["ruby"]
      },
      ntp: {
        servers: ["ntp.nict.jp", "ntp.jst.mfeed.ad.jp"]
      },
    }
    chef.run_list = %w[
      recipe[yum-epel]
      recipe[nginx]
      recipe[yum-repoforge]
      recipe[git]
      recipe[ruby-env]
      recipe[nodejs]
      recipe[screen]
      recipe[mysql]
      recipe[vim]
      recipe[gitconfig]
      recipe[command]
      recipe[ntp]
      recipe[sudoers]
    ]
  end
end
