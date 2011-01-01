load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

load 'config/deploy' # remove this line to skip loading any of the default

# ========================
#    For Mongrel Apps
# ========================

 namespace :deploy do

  task :dbseed, :roles => :app do
    run "cd #{current_path} && rake db:seed"
  end

   task :start, :roles => :app do
     run "rm -rf /home/#{user}/public_html;ln -s #{current_path}/public /home/#{user}/public_html"
     run "cd #{current_path} && mongrel_rails start -e production -p #{mongrel_port} -d"
   end

   task :restart, :roles => :app do
      run "cd #{current_path} && /usr/local/bin/mongrel_rails stop"
      run "cd #{current_path} && /usr/local/bin/mongrel_rails start -e production -p #{mongrel_port} -d"
   end

 end