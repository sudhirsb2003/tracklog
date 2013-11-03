class AddSourceAddressAndDestinationAddressToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :source_address, :text
    add_column :vehicles, :destination_address, :text
  end
end
