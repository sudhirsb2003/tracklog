class VehicleData < ActiveRecord::Base
 has_many :vehicle_document_photos
 belongs_to :vehicle
 accepts_nested_attributes_for :vehicle_document_photos
end
