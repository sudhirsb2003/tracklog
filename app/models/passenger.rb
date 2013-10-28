class Passenger < ActiveRecord::Base
  validates_uniqueness_of :vehicle_id, :scope => :user_id
  belongs_to :vehicle
  belongs_to :user
end
