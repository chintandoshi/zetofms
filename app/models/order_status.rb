class OrderStatus < ActiveRecord::Base

  validates_presence_of :order_id, :status_id, :user
  belongs_to :status, :class_name => "OrderStatusType"
  belongs_to :order
 
end
