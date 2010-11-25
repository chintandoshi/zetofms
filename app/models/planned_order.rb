class PlannedOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :vehicle

  validates_presence_of :order_id, :dispatch_date_planned, :delivery_date_planned

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
