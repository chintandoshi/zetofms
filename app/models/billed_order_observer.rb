class BilledOrderObserver < ActiveRecord::Observer

  include AuditHelper
  
  def after_create(order)
    Rails.logger.info "[ADD][#{order.class.name}][#{order.id}]:#{order.inspect}"
    Rails.logger.info "[ADD] Updating status to Billed"

    notes = "Invoice No: " + order.invoice_no.to_s + ", " +
                        "Invoice Amount: " + order.invoice_amount.to_s + ", " +
                        "Invoice Due Date: " + order.invoice_due_date.to_s(:long_ordinal) + "."

    log_status(order.order.id, :Billed, notes)

  end

end
