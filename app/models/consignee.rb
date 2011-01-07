class Consignee < ActiveRecord::Base
  validates_presence_of :consignee_name, :address, :city,
                        :state, :country, :postal_code, :phone1

  validates_format_of :email,
                        :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                        :message => 'Email address must be valid',
                        :allow_nil => true, :allow_blank => true

  has_many :contacts, :as => :resource, :dependent => :destroy
  has_many :orders, :dependent => :destroy

  def display_name
    return self.consignee_name
  end

  before_destroy :safe_to_destroy?

  private
  def safe_to_destroy?
    unless self.orders.empty?
      raise ActiveRecord::RecordNotDestroyed
    end
  end
end
