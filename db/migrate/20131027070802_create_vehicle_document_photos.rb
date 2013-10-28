class CreateVehicleDocumentPhotos < ActiveRecord::Migration
  def change
    create_table :vehicle_document_photos do |t|
      t.string :name
      t.integer :vehicle_data_id
      t.timestamps
    end
  end
end
