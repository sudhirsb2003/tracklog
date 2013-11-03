class CreateEndPoints < ActiveRecord::Migration
  def change
    create_table :end_points do |t|
      t.string :name
      t.text :address

      t.timestamps
    end
  end
end
