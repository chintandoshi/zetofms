class Contact < ActiveRecord::Base
  
  validates_presence_of :first_name, :last_name,
                        :phone1, :email, :position, :department

  validates_format_of :email,
                        :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                        :message => 'Email address must be valid',
                        :allow_nil => true, :allow_blank => true

  belongs_to :resource, :polymorphic => true
  has_many :billingcontactorders, :class_name => "Order", :foreign_key => "billingcontact_id", :dependent => :destroy
  has_many :purchasecontactorders, :class_name => "Order", :foreign_key => "purchasecontact_id",:dependent => :destroy

  def display_name
    title = self.first_name + " " + self.last_name
    title += " (" + self.position + "," + self.department + ")"
  end

  before_destroy :safe_to_destroy?

  private
  def safe_to_destroy?
    unless self.billingcontactorders.empty? && self.purchasecontactorders.empty?
       error_msg = "Unable to delete #{self.display_name} as the contact is associated to one or more orders(s) as billing or purchase contact."
      raise ActiveRecord::RecordNotDestroyed, error_msg
    end
  end

end
