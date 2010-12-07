class OrderObserver < ActiveRecord::Observer

  include AuditHelper

  def after_create(order)
    Rails.logger.info "[ADD][#{order.class.name}][#{order.id}]:#{order.inspect}"
    Rails.logger.info "[ADD] Updating status to Pending"

    notes = "Booking details entered into the system."

    log_status(order.id, :Pending, notes)
    
  end

  def before_update(order)
    Rails.logger.info "[UPDATE][#{order.class.name}][#{order.id}]:#{order.inspect}"

    if !order.changed?
      Rails.logger.info "[UPDATE]Nothing changed"
      return
    end

    if order.changed.include?("approved")
        Rails.logger.info "[UPDATE] Approval fields"
        Rails.logger.info "[UPDATE] Updating status to Acknowledged"
        #ACKNOWLEDGED
        notes = "Booking details locked."
        log_status(order.id, :Acknowledged, notes)
    end

    if order.changed.include?("cancelled")
        Rails.logger.info "[UPDATE] Cancellation fields"
        Rails.logger.info "[UPDATE] Updating status to Canceled"
        #Cancelled
        notes = "Order canceled."
        log_status(order.id, :Cancelled, notes)
    end

    if order.changed.include?("closed")
        Rails.logger.info "[UPDATE] closed fields"
        Rails.logger.info "[UPDATE] Updating status to Closed"
        #Closed
        notes = "Order closed."
        log_status(order.id, :Closed, notes)
    end

    return

  end

end


