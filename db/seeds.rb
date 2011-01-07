# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)


#set up roles
open("roles.csv") do |allroles|
  allroles.read.each_line do |role|
    id, name,description,date1, date2,tag = role.chomp.split(",")
    Role.find_or_create_by_name(:name => name,:description => description, :tag => tag)
  end
end

# create admin user with full privileges for useradmin + superuser rights
user = User.find_or_create_by_login(:login => "admin", :password => "admin", :password_confirmation => "admin", :email => "chintan.doshi@zetotech.com")
role = Role.find_by_name("useradmin")
superrole = Role.find_by_name("superuser")
user.roles << role
user.roles << superrole