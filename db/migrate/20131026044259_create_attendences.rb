class CreateAttendences < ActiveRecord::Migration
  def change
    create_table :attendences do |t|
      t.integer :user_id
      t.integer :vehicle_id
      t.integer :pick_up_point_id
      t.string :employee_id
      t.string :status

      t.timestamps
    end
  end
end
