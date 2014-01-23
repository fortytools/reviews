require 'bundler/capistrano'
require 'rvm/capistrano'

load 'deploy/assets'

set :application, "peer_review"
set :repository, "git@github.com:TobiasRaeder/peer_review.git"

set :deploy_via, :rsync_with_remote_cache

set :keep_releases, 10

role :app, "review", primary: true
role :web, "review", primary: true
role :db, "review", primary: true

set :rails_env, "production"
set :branch, "master"

set :deploy_to, "/var/www/peer_review"
set :use_sudo, false

set :ssh_options, {forward_agent: true}

after "deploy:restart", "deploy:cleanup"
