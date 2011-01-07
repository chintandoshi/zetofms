class Vmodel < ActiveRecord::Base

  validates_presence_of :model_name

  belongs_to :make
  has_many :vehicles, :dependent => :destroy

  before_destroy :ensure_no_vehicles_exist

  private
  def ensure_no_vehicles_exist
    unless self.vehicles.empty?
       error_msg = "Unable to delete #{self.model_name} as it has #{self.vehicles.size} assoicated vehicle(s)."
      raise ActiveRecord::RecordNotDestroyed, error_msg
    end
  end
end
