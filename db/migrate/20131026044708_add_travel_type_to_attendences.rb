class AddTravelTypeToAttendences < ActiveRecord::Migration
  def change
    add_column :attendences, :travel_type, :string
  end
end
