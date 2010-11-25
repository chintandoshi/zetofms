class ProductUnit < ActiveRecord::Base
    validates_presence_of :product_unit_name
    has_many :orders, :dependent => :destroy
end
