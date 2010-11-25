class BilledOrder < ActiveRecord::Base
    belongs_to :order

   validates_presence_of :order_id, :invoice_no, :invoice_amount, :invoice_due_date

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
