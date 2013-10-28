class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :password_digest
      t.boolean :is_admin, :default => false
      t.datetime :last_login_at
      t.string :distance_units
      t.text   :address
      t.string :contact_no
      t.string :blood_group
      t.string :emergency_contact_no
      t.string :family_doctor_name
      t.string :profile_title
      t.string :ref_number_1
      t.string :ref_number_2
      t.timestamps
    end

    add_index :users, :username

    #admin = User.new :username => "admin", :password => "admin"
    #admin.is_admin = true
    #admin.save
  end
end
