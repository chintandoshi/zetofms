class Driver < ActiveRecord::Base

  validates_presence_of :first_name, :last_name, :addr_line_1, :city,
                        :state, :country, :postal_code, :phone_country_1,
                        :phone_area_1, :phone_number_1, :date_of_birth
  validates_numericality_of :phone_country_1, :allow_nil => true, :allow_blank => true
  validates_numericality_of :phone_area_1, :allow_nil => true, :allow_blank => true
  validates_numericality_of :phone_number_1, :allow_nil => true, :allow_blank => true
  validates_numericality_of :phone_ext_1, :allow_nil => true, :allow_blank => true
  validates_numericality_of :phone_country_2, :allow_nil => true, :allow_blank => true
  validates_numericality_of :phone_area_2, :allow_nil => true, :allow_blank => true
  validates_numericality_of :phone_number_2, :allow_nil => true, :allow_blank => true
  validates_numericality_of :phone_ext_2, :allow_nil => true, :allow_blank => true

  has_many :attachment_boxes, :as => :resource, :dependent => :destroy
  accepts_nested_attributes_for :attachment_boxes

  def display_name
    return self.first_name + " " + self.last_name
  end
  
end
