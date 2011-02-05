require 'bundler/capistrano'

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :application, "instaderek"
set :repository,  "git@github.com:whiskeyasylum/InstaDerek.git"

set :scm, :git

set :user, 'deploy'
set :password, 'd3pl0y'

set :use_sudo, false


role :web, "instaderek.com"                          # Your HTTP server, Apache/etc
role :app, "instaderek.com"                          # This may be the same as your `Web` server
role :db,  "instaderek.com", :primary => true # This is where Rails migrations will run

set :branch, "master"

set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache

after "deploy:update_code", "deploy:symlink_config"
after "deploy:symlink_config", "deploy:migrate"
after "deploy", "deploy:cleanup"
after "deploy:symlink", "deploy:update_crontab"

deploy.task :symlink_config, :roles => :app, :except => {:no_release => true, :no_symlink => true} do
  run  <<-EOC
    ln -nsf #{shared_path}/config/database.yml #{current_release}/config
  EOC
end

deploy.task :restart do
  run "touch #{current_path}/tmp/restart.txt"
end

#desc "Update the crontab file"
#deploy.task :update_crontab, :roles => :app do
#  run "cd #{current_release} && whenever --update-crontab root"
#end

#desc "Update the crontab file"
#deploy.task :update_processor_crontab, :roles => :processor do
#  run "cd #{current_release} && whenever -f config/processor_schedule.rb --update-crontab exportcsv"
#end
