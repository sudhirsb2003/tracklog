class Vehicle < ActiveRecord::Base
  validates_presence_of :user_id, :message => "Please select a driver"
  validates_presence_of :vehicle_make, :vehicle_number
  validates_uniqueness_of :user_id, :vehicle_number
  belongs_to :user
  has_many :passengers
  has_one :vehicle_data
  belongs_to :attendence
  accepts_nested_attributes_for :vehicle_data, :reject_if => :all_blank, :allow_destroy => true
  validates_associated :vehicle_data


  extend FriendlyId
  friendly_id :vehicle_make_and_vehicle_number, use: :slugged

  def vehicle_make_and_vehicle_number
    "#{vehicle_make} number #{vehicle_number}"
  end

end
