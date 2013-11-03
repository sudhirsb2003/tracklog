class CreateStartPoints < ActiveRecord::Migration
  def change
    create_table :start_points do |t|
      t.string :name
      t.text :address

      t.timestamps
    end
  end
end
