# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

# create admin user with full privileges for admin tab
user = User.create(:login => "admin", :password => "admin", :password_confirmation => "admin", :email => "chintan.doshi@zetotech.com")
role = Role.find_by_name("useradmin")
user.roles << role