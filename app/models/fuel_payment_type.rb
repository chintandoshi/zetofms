class FuelPaymentType < ActiveRecord::Base
  validates_presence_of :name

  has_many :fuels, :dependent => :destroy
end
