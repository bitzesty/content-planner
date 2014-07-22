Content Planner
========================

A online tool to help with the HMRC Content transition and URL analysis.

The main focus of the tool is the coordination of content writing and
a dashboard to show the progress of content in various states.

This application requires:

* Ruby version 2.1.2
* Rails version 4.0.2

And depends on or uses the following parts of the GOV.UK stack:

* https://github.com/alphagov/govuk_need_api (needs)
* https://github.com/alphagov/whitehall (organisations)

Loosely related:

* https://github.com/alphagov/maslow

Running the application
---------------------

Ensure you have replicated the databases from preview (maslow, whitehall and content-planner).

  ```
  bowl content-planner
  ```

Alternatively run whitehall and govuk_need_api then run `./startup.sh`


Emails in development
---------------------

It delivers emails to [mailcatcher](http://mailcatcher.me/) when in development.

1. Install mailcatcher: `gem install mailcatcher`

2. Inside VM: `mailcatcher --http-ip 10.1.1.254`

3. From your host machine go to http://10.1.1.254:1080

Style and syntax checking
-------------------------

    bundle exec rubocop

Preview Database
----------------

The database on preview gets replaced with prod, migrations might need to be rerun.

Development via vagrant and docker
----------------------
Run vagrant: `vagrant up`. It will provide the following docker images:
  - **mysql**: persistent container for MySQL
  - **content-planner-mysql**: MySQL container with content-planner credentials
  - **content-planner-setup**: will run `bundle exec rake db:create db:migrate db:seed; RAILS_ENV=test bundle exec rake db:migrate` on **content-planner-mysql**  and then will shut down
  - **content-planner-server**: starts `mailcatcher` and `rails server`

  Vagrant provisioning will run the containers above as daemons. Rails server will be running on http://localhost:3058 and mailcatcher server will be running on http://localhost:1080

After provisioning vagrant for the first time, you'll have to start manually docker containers inside the VM:
  1. `vagrant ssh` always run docker inside VM
  2. `docker start content-planner-mysql`
  3. `docker start content-planner-server`

You can see the running containers with `docker ps`. It might also be handy to attach to a running container, such as:

  `docker attach content-planner-server`

It's recommended to use `tmux` because the only way to detach from a running container is by executing `docker stop content-planner-server`

### Interactive mode

If you want to run specs or perform any other task, you can run an interactive bash shell:
  `docker run -t -i --link content-planner-mysql:db -v /var/www/content-planner:/var/www/content-planner content-planner /bin/bash`

If you want to run the server manually, make sure you are binding the required ports
  `docker run -t -i --link content-planner-mysql:db -v /var/www/content-planner:/var/www/content-planner -p 3058:3058 -p 1080:1080 content-planner /bin/bash`

### Building content-planner image

Let's say, for instance, we are adding new gems. We want to `bundle install` on the image so that the gems are persisted in the container. In that case, you'll rebuild the **content-planner** image:
  `docker build -t content-planner /var/www/content-planner`

The above command will use the `Dockerfile` inside `/var/www/content-planner`
