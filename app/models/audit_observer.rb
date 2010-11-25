class AuditObserver < ActiveRecord::Observer
  observe :order

  def after_create(auditable)
    Rails.logger.info "[ADD][#{auditable.class.name}][#{auditable.id}]:#{auditable.inspect}"
  end

  def before_update(auditable)
    Rails.logger.info "[MOD][#{auditable.class.name}][#{auditable.id}]:#{auditable.changed.inspect}"
    Rails.logger.info "[MOD]#{auditable.quantity_change}"
  end

  def before_destroy(auditable)
    Rails.logger.info "[DEL][#{auditable.class.name}][#{auditable.id}]:#{auditable.inspect}"
  end
end
