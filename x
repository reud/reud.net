#!/bin/zsh

emulate -R sh

cmd=${1}

# shellcheck disable=SC2068
case "$cmd" in
  s) bin/rails server ;;
  rc) bin/rails console ;;
  annotate) bundle exec annotate ;;
  rspec) bin/rspec ${@:2} ;;
  migrate) bin/rails db:migrate RAILS_ENV=development ;;
  genmig) bin/rails generate migration ${@:2} ;;
  chownmig) sudo chown -R reud:reud db/migrate/ ;;
  chownmod) sudo chown -R reud:reud app/models/ ;;
  migstatus) bin/rails db:migrate:status ;;
  migver) bin/rails db:migrate:up VERSION=${@:2} ;;
  migverd) bin/rails db:migrate:down VERSION=${@:2} ;;
  db-create) bin/rails db:create ;;
  db-migrate) bin/rails db:migrate ;;
  db-drop) bin/rails db:drop ;;
  db-seed) bin/rails db:seed ;;
  gmodel)  bin/rails generate model ${@:2} --no-migration ;;
esac
