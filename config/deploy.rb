# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'test_temona'
set :repo_url, 'git@github.com:leminhtuan2015/test_temona.git'
set :deploy_to, '/home/framgia/test_temona'

set :rvm_ruby_version, '2.1.5'
set :default_env, { rvm_bin_path: '~/.rvm/bin' }
SSHKit.config.command_map[:rake] = "#{fetch(:default_env)[:rvm_bin_path]}/rvm ruby-#{fetch(:rvm_ruby_version)} do bundle exec rake"

# set :bundle_gemfile, "Gemfile"

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache',
  'tmp/sockets', 'vendor/bundle', 'public/system')

set :current_path, '/home/framgia/test_temona/current'

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      p "DONE DONE DONE................."
      # execute "cd /home/framgia/test_temona/current"
      # run "bundle exec rake db:setup"
    end
  end

  after :deploy, "deploy:restart"
end
