#!/bin/sh

PATH=/opt/ruby/1.9.3/bin:/opt/ruby/1.9.2/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
export RAILS_ENV=test
rake db:migrate:reset
rake test
