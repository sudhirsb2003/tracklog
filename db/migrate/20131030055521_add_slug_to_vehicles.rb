class AddSlugToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :slug, :string
  end
end
