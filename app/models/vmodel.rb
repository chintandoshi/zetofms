class Vmodel < ActiveRecord::Base

  validates_presence_of :model_name

  belongs_to :make
  has_many :vechiles, :dependent => :destroy

  before_destroy :ensure_no_vehicles_exist

  private

  def ensure_no_vehicles_exist
    unless self.vehicles.empty?
      self.errors.add_to_base "Cant delete a vehicle model that has associated vehicles"
      raise ActiveRecord::RecordNotDestroyed
    end
  end
end
