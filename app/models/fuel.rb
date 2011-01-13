class Fuel < ActiveRecord::Base
  
  validates_presence_of :allocation_date, :vehicle_id, :branch_id, :petrol_pump_id,
                        :fuel_payment_type_id, :issued_qty, :issued_rate, :issued_amount
  validates_presence_of :fleet_card_id, :if => :is_fleet_card?

  belongs_to :vehicle
  belongs_to :branch
  belongs_to :petrol_pump
  belongs_to :fuel_payment_type
  belongs_to :fleet_card

  def is_fleet_card?
    self.fuel_payment_type_id == FuelPaymentType.find_by_name("Fleet Card").id
  end
end
