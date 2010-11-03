class Contact < ActiveRecord::Base
  
  validates_presence_of :first_name, :last_name,
                        :phone1, :email, :position, :department

  validates_format_of :email,
                        :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                        :message => 'Email address must be valid',
                        :allow_nil => true, :allow_blank => true

  belongs_to :resource, :polymorphic => true

  def display_name
    title = self.first_name + " " + self.last_name
    title += " (" + self.position + "," + self.department + ")"
  end

end
