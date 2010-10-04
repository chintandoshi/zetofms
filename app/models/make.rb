class Make < ActiveRecord::Base
  
  validates_presence_of :make_name

  has_many :vmodels, :dependent => :destroy
  
end
