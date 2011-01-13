class PetrolPump < ActiveRecord::Base
  validates_presence_of :name, :city

  has_many :fuels, :dependent => :destroy
end
