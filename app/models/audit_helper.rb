# To change this template, choose Tools | Templates
# and open the template in the editor.

module AuditHelper
  
    def log_status(order_id, status_code, text  )
      
      #OrderStatus
      current_user_session = UserSession.find
      orderstatustype = OrderStatusType.status(status_code)
      orderstatus = OrderStatus.new()
      orderstatus.order_id = order_id
      orderstatus.status_id = orderstatustype.id
      orderstatus.user = current_user_session.record.login
      orderstatus.notes = text
      orderstatus.save

      #Order
      order = Order.find_by_id(order_id)
      order.current_status_id = orderstatus.status_id
      order.save

    end
    
end
