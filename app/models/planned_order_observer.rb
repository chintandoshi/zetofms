class PlannedOrderObserver < ActiveRecord::Observer

  include AuditHelper

  def after_create(order)
    Rails.logger.info "[ADD][#{order.class.name}][#{order.id}]:#{order.inspect}"
    Rails.logger.info "[ADD] Updating status to Planning"

    notes = "Dispatch Date Planned: " + order.dispatch_date_planned.to_s(:long_ordinal) + ", " +
            "Delivery Date Planned: " + order.delivery_date_planned.to_s(:long_ordinal) + "."
    
    log_status(order.order.id, :Planning, notes)
  end
  
end
