class AddGmapsToEndPoint < ActiveRecord::Migration
  def change
    add_column :end_points, :vehicle_id, :integer
    add_column :end_points, :latitude, :float
    add_column :end_points, :longitude, :float
    add_column :end_points, :gmaps, :boolean
  end
end
