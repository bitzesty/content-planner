#!/bin/bash

# export gem binaries so /usr/bin/env ruby doesn't complain
export PATH=/.rbenv/versions/2.1.2/bin/:$PATH
mailcatcher --http-ip 0.0.0.0
bundle exec rails s -p 3058
