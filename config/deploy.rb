set :application, "Hamsters Online"
set :rvm_type, :system
set :bundle_without, [:development, :test]

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
load 'deploy/assets'

before "deploy:assets:precompile", "deploy:assets:clean"