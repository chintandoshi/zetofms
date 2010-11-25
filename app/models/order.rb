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

  named_scope :open, :conditions => ['cancelled = ?', 0]

  before_create :created_by_user
  before_save :updated_by_user

  def created_by_user
    current_user_session = UserSession.find
    self.created_by = current_user_session.record.login
  end

  def updated_by_user
    current_user_session = UserSession.find
    self.updated_by = current_user_session.record.login
  end



end
