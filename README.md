Content Planner
========================

A online tool to help with the HMRC Content transition and URL analysis.

The main focus of the tool is the coordination of content writing and
a dashboard to show the progress of content in various states.

This application requires:

* Ruby version 2.0.0-p353
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


Local Setup:

  ```
  bundle
  rake db:create db:migrate db:dummy
  ```

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
