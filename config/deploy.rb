set :application, "Hamsters Online"
set :rvm_type, :system
set :bundle_without, [:development, :test, :deploy]

set :repository,  "git@github.com:workmad3/hamster_entries.git"
set :user, 'hamster-entries'
set :use_sudo, false

set :scm, :git
set :deploy_via, :remote_cache
set :deploy_to, '/home/hamster-entries'
ssh_options[:forward_agent] = true

["192.34.63.233"].each do |url|
  role :web, url                          # Your HTTP server, Apache/et
  role :app, url                          # This may be the same as your `Web` server
  role :db,  url, :primary => true # This is where Rails migrations will run
end

after "deploy:restart", "deploy:cleanup"

require 'bundler/capistrano'
require "rvm/capistrano"
require 'capistrano-unicorn'
load 'deploy/assets'

namespace :deploy do
  task :symlink_secret_key do
    run <<-CMD.compact
      cd -- #{latest_release.shellescape} &&
      rm  #{latest_release}/config/initializers/secret_token.rb &&
      ln -s -- #{shared_path.shellescape}/secret_token.rb #{latest_release.shellescape}/config/initializers/secret_token.rb
    CMD
  end
  namespace :assets do
    task :update_asset_mtimes do
    end

    task :precompile do
      run <<-CMD.compact
        cd -- #{latest_release.shellescape} &&
        #{rake} RAILS_ENV=#{rails_env.to_s.shellescape} #{asset_env}
        assets:precompile
      CMD
    end
  end
end

after "deploy:update_code", "deploy:symlink_secret_key"