# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'apii_sim_backoffice'
set :repo_url, 'https://github.com/CanalTP-Cityway/apii_sim_backoffice.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml config/environments/production.rb}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5



#after "deploy:update", "deploy:cleanup", "deploy:group_writable"

namespace :deploy do

  desc "Install gems"
  task :gems do
    on roles(:app) do
      execute "cd #{release_path} && umask 02 && bundle install --path=#{shared_path}/bundle --without=development:test:cucumber"
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart
  
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
  
  namespace :assets do
    
    desc "Compile the assets named in config.assets.precompile"
    task :precompile do
      on roles(:app) do
        execute "cd #{release_path} && RAILS_ENV=production bundle exec rake assets:clobber assets:precompile"
      end
    end
  end
  
end

after "deploy:updating", "deploy:gems"
after "deploy:gems", "deploy:assets:precompile"
