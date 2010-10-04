class Vehicle < ActiveRecord::Base

  validates_presence_of :registration_number
  validates_uniqueness_of :registration_number
  validates_presence_of :vmodel_id, :message => "Please specify the vehicle type"
  validate_on_create :validate_products

  has_many :attachment_boxes, :as => :resource, :dependent => :destroy
  accepts_nested_attributes_for :attachment_boxes
  
  belongs_to :vmodel
  has_one :make, :through => :vmodel
  has_and_belongs_to_many :product_types

  attr_accessor :product_list

  named_scope :filter_by_make, lambda { | make_id | {:joins => :vmodel, :conditions => ['vmodels.make_id = ?', make_id]} }

  private

  def validate_products
    if product_list.nil?
        errors.add_to_base "Select atleast one product for this vehicle"
        return false
    end
  end

end
