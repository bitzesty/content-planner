source "https://rubygems.org"
ruby "2.0.0"

gem "rails", "4.0.2"
gem "sass-rails", "~> 4.0.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.0.0"
gem "jquery-rails"
gem "turbolinks"
gem "jbuilder", "~> 1.2"
gem "bootstrap-sass", "~> 2.3.2.2"
gem "mysql2"
gem "unicorn"
gem "simple_form", ">= 3.0.0.rc"
gem "slim"
gem "draper"
gem "decent_exposure"
gem "decent_decoration"
gem "active_hash"
gem "kaminari"
gem "acts-as-taggable-on"
gem "select2-rails"
gem "searchlight"
gem "paper_trail", ">= 3.0.0.rc1"
gem "govspeak", ">= 1.3.0"
gem "plek", ">= 1.0.0"
gem "gds-sso", "7.0.0", github: "alphagov/gds-sso"
gem "gds-api-adapters", "7.20.0"
gem "pundit"
gem "logstasher", "0.4.1"

gem "aws-ses", require: "aws/ses" # Needed by exception_notification
gem "exception_notification"
gem "highcharts-rails", "~> 3.0.0"
gem "dullard"

group :development do
  gem "rubocop"
  gem "better_errors"
  gem "binding_of_caller"
  gem "quiet_assets"
  gem "capistrano"
end

group :development, :test do
  gem "factory_girl_rails"
  gem "rspec-rails"
  gem "rails-pry"
end

group :test do
  gem "capybara"
  gem "database_cleaner", "1.0.1"
  gem "ci_reporter"
  gem "simplecov"
  gem "simplecov-rcov"
end
