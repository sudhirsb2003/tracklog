class Vehicle < ActiveRecord::Base
  validates_presence_of :user_id, :message => "Please select a driver"
  validates_presence_of :vehicle_make, :vehicle_number
  validates_uniqueness_of :user_id, :vehicle_number
  belongs_to :user
  has_one :vehicle_data
  accepts_nested_attributes_for :vehicle_data, :reject_if => :all_blank, :allow_destroy => true
  validates_associated :vehicle_data
end
