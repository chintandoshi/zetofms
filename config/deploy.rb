set :application, "zetocrm.com"
set :user, "p68454r8"
set :repository,  "p68454r8@zetocrm.com:/home/p68454r8/git/ZetoCRM.git"

set :scm, :git
set :runner, user
set :use_sudo, false
set :branch, "master"
set :deploy_to, "/home/#{user}/apps/#{application}"
default_run_options[:pty] = true
ssh_options[:keys] = %w(/home/p68454r8/.ssh/id_dsa.pub)

set :group_writable, false                            # By default, Capistrano makes the release group-writable. You don't want this with HostingRails
set :mongrel_port, "19040"                           # Mongrel port that was assigned to you
set :mongrel_nodes, "1"                             # Number of Mongrel instances for those with multiple Mongrels

role :web, application                         # Your HTTP server, Apache/etc
role :app, application                 # This may be the same as your `Web` server
role :db,  application, :primary => true # This is where Rails migrations will run