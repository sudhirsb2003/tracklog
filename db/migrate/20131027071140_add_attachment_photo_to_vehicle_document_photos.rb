class AddAttachmentPhotoToVehicleDocumentPhotos < ActiveRecord::Migration
  def self.up
    change_table :vehicle_document_photos do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :vehicle_document_photos, :photo
  end
end
