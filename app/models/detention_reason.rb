class DetentionReason < ActiveRecord::Base
  validates_presence_of :description

  has_many :detentions, :dependent => :destroy

  before_destroy :ensure_no_detentions_exist

  private
  def ensure_no_detentions_exist
    unless self.detentions.empty?
       error_msg = "Unable to delete #{self.description} as it has #{self.detentions.size} assoicated detention(s)."
      raise ActiveRecord::RecordNotDestroyed, error_msg
    end
  end
end
