class Detention < ActiveRecord::Base

  validates_presence_of :order_id, :detention_location_id, :start_time,
                        :detention_reason_id

  belongs_to :order
  belongs_to :detention_reason

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
