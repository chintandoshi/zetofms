class Custaccount < ActiveRecord::Base
   validates_presence_of :company_name, :address,  :city,
                        :state, :country, :postal_code, :phone1

   validates_format_of :email,
                        :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                        :message => 'Email address must be valid',
                        :allow_nil => true, :allow_blank => true

  has_many :custcontacts, :dependent => :destroy

  def display_name
    return self.company_name
  end
end
