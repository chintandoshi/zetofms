class AttachmentBoxesController < ApplicationController
   
  def show
    attachment = AttachmentBox.find(params[:id])

    #x_sendfile only available on Apache2 w/ mod_xsendfile or Lighttpd
    if Rails.env.production?
      send_file attachment.uploadedfile.path, :type => attachment.uploadedfile_content_type, :x_sendfile => true
    else
      send_file attachment.uploadedfile.path, :type => attachment.uploadedfile_content_type
    end
  end

  def destroy
    attachment_box = AttachmentBox.find(params[:id])
    attachment_box.destroy
    redirect_to :back, :method => :get
  end
end
