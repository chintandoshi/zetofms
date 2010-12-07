# To change this template, choose Tools | Templates
# and open the template in the editor.

module AuditHelper
  
    def log_status(order_id, status_code, text  )
      current_user_session = UserSession.find
      orderstatus = OrderStatus.new()
      orderstatus.order_id = order_id
      orderstatus.status_id = OrderStatusType.status(status_code).id
      orderstatus.user = current_user_session.record.login
      orderstatus.notes = text
      orderstatus.save
    end
    
end
