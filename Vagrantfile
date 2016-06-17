# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.define :md_analysis do |analysis_config|
        analysis_config.vm.box = "precise64"
    	analysis_config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
        analysis_config.ssh.forward_agent = true

        # This will give the machine a static IP uncomment to enable
        analysis_config.vm.network :private_network, ip: "192.168.37.175"

        analysis_config.vm.network :forwarded_port, guest: 80, host: 1111, auto_correct: true
        analysis_config.vm.network :forwarded_port, guest: 3306, host: 1112, auto_correct: true
        analysis_config.vm.network :forwarded_port, guest: 5432, host: 5433, auto_correct: true
        analysis_config.vm.hostname = "md-audio-analysis"
        analysis_config.vm.provision :shell, :inline => "sed -i 's/^mesg n$/tty -s \\&\\& mesg n/g' /root/.profile"
        analysis_config.vm.provision :shell, :inline => "echo \"America/Chicago\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"

        analysis_config.vm.provider :virtualbox do |v|
            v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            v.customize ["modifyvm", :id, "--memory", "5120"]
        end

        analysis_config.vm.provision :puppet do |puppet|
            #puppet.hiera_config_path = "hiera.yaml"
            puppet.manifests_path = "puppet/manifests"
            puppet.manifest_file  = "base.pp"
            #puppet.module_path = "puppet/modules"
            #puppet.options = "--verbose --debug"
        end
    end
end
