class CreatePickUpPoints < ActiveRecord::Migration
  def change
    create_table :pick_up_points do |t|
      t.string :name
      t.text :address

      t.timestamps
    end
  end
end
