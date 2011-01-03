class Order < ActiveRecord::Base
   
  validates_presence_of :consignor_id,
    :consignee_id,
    :custaccount_id,
    :billingcontact_id,
    :purchasecontact_id,
    :product_type_id,
    :product_unit_id,
    :quantity,
    :to,
    :from,
    :dispatch_date_requested,
    :placement_date_time

  belongs_to :consignor
  belongs_to :consignee
  belongs_to :custaccount
  belongs_to :billingcontact,:class_name => "Contact"
  belongs_to :purchasecontact,:class_name => "Contact"
  belongs_to :product_type
  belongs_to :product_unit
  has_one :planned_order
  has_one :loaded_order
  has_one :delivered_order
  has_one :billed_order
  has_many :detentions
  has_many :order_statuses, :dependent => :destroy
  belongs_to :current_status, :class_name => "OrderStatusType"

  has_many :attachment_boxes, :as => :resource, :dependent => :destroy
  accepts_nested_attributes_for :attachment_boxes
  
  named_scope :open, :conditions => ['cancelled = ?', 0]

  #demonstrative
  #named_scope :find_by_status, lambda {|status_id|
  #  {:include => ["order_statuses"],
  #    :conditions => ["order_statuses.status_id = ? and order_statuses.created_at = (select max(created_at) from order_statuses where order_id = orders.id)", status_id],
  #    :order => ("orders.created_at DESC")
  #}}

  before_create :created_by_user
  before_save :updated_by_user

  def created_by_user()
    current_user_session = UserSession.find
    self.created_by = current_user_session.record.login
  end

  def updated_by_user()
    current_user_session = UserSession.find
    self.updated_by = current_user_session.record.login
  end

    #Order tab logic
    def planning_enabled? ()
      return self.approved?
    end

    def loading_enabled? ()
      return self.approved?
    end

    def delivery_enabled? ()
      return self.approved? && self.loaded_order
    end

    def detention_enabled?()
      return self.approved?
    end

    def billing_enabled? ()
      return self.approved? && self.loaded_order && self.loaded_order.approved? && self.delivered_order && self.delivered_order.approved?
    end

    # buttons on each panel
    def enable_tab_controls? ()
      return !self.cancelled? &&  !self.closed?
    end

    #close/lock order button
    def close_order_enabled? ()
      return self.billed_order && self.billed_order.approved? && !self.cancelled? & !self.closed?
    end

    #cancel button
    def cancel_order_enabled? ()
      if self.closed?
        return false
      end

      if self.cancelled?
        return false
      end
      
      return true
    end

end
