class ProductUnit < ActiveRecord::Base
    validates_presence_of :product_unit_name
    has_many :orders, :dependent => :destroy

    before_destroy :ensure_no_orders_exist

    private
      def ensure_no_orders_exist

        unless  self.orders.empty?
           error_msg = "Unable to delete #{self.product_unit_name} as it has #{self.orders.size} assoicated order(s)."
          raise ActiveRecord::RecordNotDestroyed, error_msg
        end
      end
end
