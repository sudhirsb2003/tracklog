class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.integer :user_id
      t.integer :vehicle_id

      t.timestamps
    end
  end
end
