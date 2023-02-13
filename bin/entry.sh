#!/bin/sh
set -e
bundle install
# rails webpacker:install 
rails db:migrate || :

exec bundle exec "$@"