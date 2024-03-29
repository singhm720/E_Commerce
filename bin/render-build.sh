#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean

./bin/render-build.sh
./bin/rails db:migrate
./bin/rails server