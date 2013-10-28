class CreateVehicleData < ActiveRecord::Migration
  def change
    create_table :vehicle_data do |t|
      t.string :registration_data
      t.date :purchase_date_and_year
      t.string :owner_name
      t.text :owner_address
      t.text :vehicle_detail
      t.integer :vehicle_id

      t.timestamps
    end
  end
end
