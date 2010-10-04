class AttachmentBox < ActiveRecord::Base
      has_attached_file :uploadedfile,
                    :styles => {
                    :thumb=> "100x100#",
                    :small  => "150x150>" }

      belongs_to :resource, :polymorphic => true

      validates_attachment_presence :uploadedfile, :message => "Please select a file to upload"
      validates_attachment_content_type :uploadedfile, :content_type => [ 'application/pdf',
                                                                           'image/jpeg',
                                                                            'image/png',
                                                                            'application/doc',
                                                                            'text/plain'],
                                                         :message => "Invalid File content type"
      validates_attachment_size :uploadedfile, :less_than=>1.megabyte, :message => "Fize size must <= 1 MB"

end
