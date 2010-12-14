class OrderStatus < ActiveRecord::Base

  validates_presence_of :order_id, :status_id, :user
  belongs_to :status, :class_name => "OrderStatusType"
  belongs_to :order

  #demonstrative
  #named_scope :latest_status_by_order, lambda {|order_id| { :conditions=>{:order_id=>order_id}, :order => ("created_at DESC"), :limit => 1}}
 
end
