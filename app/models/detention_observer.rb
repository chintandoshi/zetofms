class DetentionObserver < ActiveRecord::Observer

  include AuditHelper
  
  def after_create(order)
    Rails.logger.info "[ADD][#{order.class.name}][#{order.id}]:#{order.inspect}"
    Rails.logger.info "[ADD] Updating status to Detention"

   notes = "Place: " + (order.detention_location_id == 1 ? "Consignee" : "Consignor") + ", " +
                        "Reason: " + order.detention_reason.description  + ", " +
                        "Start Time: " + order.start_time.strftime('%d %b %Y %H:%M %Z') + "."

    log_status(order.order.id, :Detention, notes)
  end
end
