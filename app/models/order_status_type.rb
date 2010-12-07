class OrderStatusType < ActiveRecord::Base
  validates_presence_of :description

  has_many :order_statuses, :dependent => :destroy, :foreign_key => "status_id"
  has_many :orders, :through => :order_statuses, :source => :order, :order => 'orders.created_at DESC'

  def self.status (value)
    self.find_by_description(value.to_s)
  end
  
end
