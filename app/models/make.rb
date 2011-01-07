class Make < ActiveRecord::Base
  
  validates_presence_of :make_name

  has_many :vmodels, :dependent => :destroy

  before_destroy :ensure_no_vmodels_exist

  private
  def ensure_no_vmodels_exist
    unless self.vmodels.empty?
        raise ActiveRecord::RecordNotDestroyed
    end
  end
  
end
