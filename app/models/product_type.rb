class ProductType < ActiveRecord::Base
  validates_presence_of :product_type_name

  has_and_belongs_to_many :vehicles
  has_many :orders, :dependent => :destroy

  before_destroy :ensure_no_orders_or_vehicles_exist

  private
  def ensure_no_orders_or_vehicles_exist

    unless self.vehicles.empty? && self.orders.empty?
      if self.vehicles.size > 0
       error_msg = "Unable to delete #{self.product_type_name} as it has #{self.vehicles.size} assoicated vehicle(s)."
      else
       error_msg = "Unable to delete #{self.product_type_name} as it has #{self.orders.size} assoicated order(s)."
      end
      raise ActiveRecord::RecordNotDestroyed, error_msg
    end
  end
end
