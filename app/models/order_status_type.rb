class OrderStatusType < ActiveRecord::Base
  validates_presence_of :description

  has_many :order_statuses, :dependent => :destroy, :foreign_key => "status_id"
  has_many :current_orders, :dependent => :destroy, :class_name => "Order", :foreign_key => "current_status_id"

  def self.status (value)
    self.find_by_description(value.to_s)
  end
  
end
