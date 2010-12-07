class DeliveredOrderObserver < ActiveRecord::Observer

  include AuditHelper

    def after_create(order)
      Rails.logger.info "[ADD][#{order.class.name}][#{order.id}]:#{order.inspect}"
      Rails.logger.info "[ADD] Updating status to Delivered"

      notes = "Delivery Date: " + order.delivery_date.to_s(:long_ordinal) + "."

      log_status(order.order.id, :Delivered, notes)
    end


end
