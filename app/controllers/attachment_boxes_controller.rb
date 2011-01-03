class AttachmentBoxesController < ApplicationController

  before_filter :find_resource
  filter_access_to :index, :create, :show, :destroy
  
  def find_resource
    params.each do |name, value|
      if name =~ /(.+)_id$/
        @resource = $1.classify.constantize.find(value)
        return
      end
    end
    @resource = nil
  end

  def index

  end

  def create
    @attachment_box =  @resource.attachment_boxes.build(params[:attachment_box])
    @attachment_box.username = current_user_session.record.login
    model_name = @resource.class.to_s.underscore

    respond_to do |format|
      if @attachment_box.save
        format.html { redirect_to( send("#{model_name}_attachment_boxes_path", @resource), :notice => 'Attachment was successfully uploaded.') }
      else
        format.html { redirect_to( send("#{model_name}_attachment_boxes_path", @resource), :notice => 'There was a problem uploading file') }
      end
    end
  end

  def show
    attachment_box = AttachmentBox.find(params[:id])

    #x_sendfile only available on Apache2 w/ mod_xsendfile or Lighttpd
    if Rails.env.production?
      send_file attachment_box.uploadedfile.path, :type => attachment_box.uploadedfile_content_type
    else
      send_file attachment_box.uploadedfile.path, :type => attachment_box.uploadedfile_content_type
    end
  end

  def destroy
    model_name = @resource.class.to_s.underscore
    attachment_box = AttachmentBox.find(params[:id])
    attachment_box.update_attribute(:uploadedfile, nil)
    attachment_box.destroy
    redirect_to(send("#{model_name}_attachment_boxes_path", @resource), :notice => "Attachment successfully deleted.")
  end
end
