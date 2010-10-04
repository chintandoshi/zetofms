class ProductType < ActiveRecord::Base
  validates_presence_of :product_type_name

  has_and_belongs_to_many :vehicles
end
