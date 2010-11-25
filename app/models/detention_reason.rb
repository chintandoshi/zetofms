class DetentionReason < ActiveRecord::Base
  validates_presence_of :description

  has_many :detention, :dependent => :destroy
end
