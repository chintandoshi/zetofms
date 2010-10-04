class CreateAttachmentBoxes < ActiveRecord::Migration
  def self.up
    create_table :attachment_boxes do |t|
        t.string :uploadedfile_file_name # Original filename
        t.string  :uploadedfile_content_type # Mime type
        t.string  :uploadedfile_file_size # File size in bytes
        t.integer :resource_id #polymorphic fk
        t.string :resource_type #polymorphic fk
        t.string :username
      t.timestamps
    end
  end

  def self.down
    drop_table :attachment_boxes
  end
end
