class Passenger < ActiveRecord::Base
  validates_presence_of :user_id , :vehicle_id
  validates_uniqueness_of :user_id, :scope => :vehicle_id
  belongs_to :vehicle
  belongs_to :user
end
