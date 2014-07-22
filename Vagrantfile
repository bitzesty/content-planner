VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "docker-ubuntu-12.04.3-amd64-vbox"
  config.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/ubuntu-12.04.3-amd64-vbox.box"
  config.vm.synced_folder ".", "/var/www/content-planner"

  config.vm.network :forwarded_port, guest: 3058, host: 3058 # rails
  config.vm.network :forwarded_port, guest: 1080, host: 1080 # mailcatcher

  config.vm.provision "docker"

  cmd = <<-SCRIPT
  echo -e "nameserver 127.0.0.1\nnameserver 8.8.8.8\nnameserver 8.8.4.4" | tee /etc/resolv.conf
  docker build -t content-planner /var/www/content-planner/
  SCRIPT

  # config.vm.provision "docker" do |d|
  #   d.build_image "/var/www/content-planner",
  #     args: "-t content-planner"
  # end

  config.vm.provision :shell, :inline => cmd

  # docker images:
  config.vm.provision "docker" do |d|
    # build content-planner
    # d.build_image "/var/www/content-planner",
    #   args: "-t content-planner"

    # mysql
    d.run "mysql",
      args: "--name mysql -v /var/lib/mysql"

    # content-planner-mysql
    d.run "content-planner-mysql",
      args: "--name content-planner-mysql --volumes-from mysql -e MYSQL_ROOT_PASSWORD=content-planner",
      image: "mysql"

    # content-planner-mysql-setup
    d.run "content-planner-mysql-setup",
      args: "--rm --link content-planner-mysql:db -v /var/www/content-planner:/var/www/content-planner",
      cmd: "bash -c 'cat config/docker_mysql.sql | mysql -u root -pcontent-planner -h db'",
      daemonize: false,
      image: "content-planner"

    # content-planner-setup
    d.run "content-planner-setup",
      args: "--name content-planner-setup --link content-planner-mysql:db -v /var/www/content-planner:/var/www/content-planner",
      cmd: "bash -c 'source /.bashrc; bundle exec rake db:create db:migrate db:seed; RAILS_ENV=test bundle exec rake db:migrate'",
      daemonize: false,
      image: "content-planner"

    # content-planner-server
    d.run "content-planner-server",
      args: "--name content-planner-server --link content-planner-mysql:db -p 3058:3058 -p 1080:1080 -v /var/www/content-planner:/var/www/content-planner",
      image: "content-planner"
  end
end
