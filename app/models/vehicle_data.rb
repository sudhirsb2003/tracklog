class VehicleData < ActiveRecord::Base
 has_many :vehicle_document_photos
 belongs_to :vehicle
 accepts_nested_attributes_for :vehicle_document_photos
 validates_uniqueness_of :registration_data, :scope => :vehicle_id, :message=> lambda { |r| "#{r.registration_data} already has been taken by #{r.vehicle}"}
end
