require 'bundler/capistrano'
require 'puma/capistrano'
load 'config/recipes/base'
load 'config/recipes/nginx'

server "82.196.0.243", :web, :app, :db, primary: true


set :application, "eyebfotoschule"
set :user, "deployer"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :rails_env, 'production'

set :scm, "git"
set :repository, "git@github.com:MJLang/eyebfotoschule.git"
set :branch, "master"


default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup"
