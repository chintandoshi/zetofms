class LoadedOrderObserver < ActiveRecord::Observer

  include AuditHelper
  
  def after_create(order)
    Rails.logger.info "[ADD][#{order.class.name}][#{order.id}]:#{order.inspect}"
    Rails.logger.info "[ADD] Updating status to Loaded"

    notes = "Loading date: " + order.loading_date.to_s(:long_ordinal) + ", " +
            "Vehicle No: " + order.vehicle.registration_number + "."

    log_status(order.order.id, :Loaded, notes)
  end

end
