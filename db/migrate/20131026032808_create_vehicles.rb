class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :vehicle_make
      t.string :vehicle_number
      t.integer :user_id

      t.timestamps
    end
  end
end
