class Vehicle < ActiveRecord::Base

  #validations
  validates_presence_of :registration_number
  validates_uniqueness_of :registration_number
  validates_presence_of :vmodel_id, :message => "Please specify the vehicle type"
  validate_on_create :validate_products

  #associations
  has_many :attachment_boxes, :as => :resource, :dependent => :destroy
  belongs_to :vmodel
  has_one :make, :through => :vmodel
  has_and_belongs_to_many :product_types
  has_many :planned_orders
  has_many :loaded_orders
  has_many :fuels, :dependent => :destroy

  accepts_nested_attributes_for :attachment_boxes

  attr_accessor :product_list

  # Scopes
  named_scope :active,  :conditions => { :retired_at => nil }
  named_scope :retired, :conditions => ['retired_at IS NOT NULL']
  named_scope :filter_by_make, lambda { | make_id | {:joins => :vmodel, :conditions => ['vmodels.make_id = ?', make_id]} }

  before_destroy :ensure_safe_to_destroy

  private
  def ensure_safe_to_destroy
    unless self.planned_orders.empty? and self.loaded_orders.empty?
       error_msg = "Unable to delete #{self.registration_number} as it has 1 or more orders associated with it. Delete the orders first"
      raise ActiveRecord::RecordNotDestroyed, error_msg
    end
  end

  def validate_products
    if product_list.nil?
        errors.add_to_base "Select atleast one product for this vehicle"
        return false
    end
  end

end
