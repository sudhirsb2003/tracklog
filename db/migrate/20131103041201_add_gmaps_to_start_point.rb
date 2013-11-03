class AddGmapsToStartPoint < ActiveRecord::Migration
  def change
    add_column :start_points, :vehicle_id, :integer
    add_column :start_points, :latitude, :float
    add_column :start_points, :longitude, :float
    add_column :start_points, :gmaps, :boolean
  end
end
