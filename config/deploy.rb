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
set :normalize_asset_timestamps, false

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup"


namespace :deploy do
  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      from = source.next_revision(current_revision)
      if releases.length <= 1 || capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
  end
end

before "deploy:finalize_update", "deploy:assets:precompile"