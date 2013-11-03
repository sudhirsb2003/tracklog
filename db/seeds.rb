
  puts "Putting some app specific seed data to speed up development"
  puts "Generating Users ..."
  User.create!(:name => "Sudhir Vishwakarma" ,
               :username => "sudhirsb2003",
               :password => "sudhirsb",
               :is_admin => true,
               :address => Faker::Address.street_address,
               :contact_no => Faker::PhoneNumber.phone_number,
               :blood_group => "b+",
               :emergency_contact_no=> Faker::PhoneNumber.phone_number,
               :family_doctor_name => Faker::Name.name,
               :profile_title => "employee",
               :ref_number_1 => Faker::PhoneNumber.phone_number,
               :ref_number_2=> Faker::PhoneNumber.phone_number)
  28.times do
  user_1 = User.create!( :name => Faker::Name.name ,
                       :username => Faker::Internet.user_name,
                       :password => "sudhirsb",
                       :is_admin => false,
                       :address => Faker::Address.street_address,
                       :contact_no => Faker::PhoneNumber.phone_number,
                       :blood_group => "b+",
                       :emergency_contact_no=> Faker::PhoneNumber.phone_number,
                       :family_doctor_name => Faker::Name.name,
                       :profile_title => "driver",
                       :ref_number_1 => Faker::PhoneNumber.phone_number,
                       :ref_number_2=> Faker::PhoneNumber.phone_number)
  end

  50.times do
  user = User.create!( :name => Faker::Name.name ,
                       :username => Faker::Internet.user_name,
                       :password => "sudhirsb",
                       :is_admin => false,
                       :address => Faker::Address.street_address,
                       :contact_no => Faker::PhoneNumber.phone_number,
                       :blood_group => "b+",
                       :emergency_contact_no=> Faker::PhoneNumber.phone_number,
                       :family_doctor_name => Faker::Name.name,
                       :profile_title => "employee",
                       :ref_number_1 => Faker::PhoneNumber.phone_number,
                       :ref_number_2=> Faker::PhoneNumber.phone_number)
  end
 vehicle_make = ["Tata", "Maruti Suzuki", "Toyota", "Honda","Mahindra", "Hyundai", "General Motor", "Renault", "Opel"]
 vehicle_number = ["MH 01 AB 1001", "MH 01 AB 1002","MH 01 AB 1003","MH 01 AB 1004","MH 01 AB 1005","MH 01 AB 1006","MH 01 AB 1007","MH 01 AB 1008","MH 01 AB 1009","MH 01 AB 1010","MH 01 AB 1011","MH 01 AB 1012","MH 01 AB 1013","MH 01 AB 1014","MH 01 AB 1015","MH 01 AB 1016","MH 01 AB 1017","MH 01 AB 1018","MH 01 AB 1019","MH 01 AB 1020","MH 01 AB 1021","MH 01 AB 1022","MH 01 AB 1023","MH 01 AB 1024","MH 01 AB 1025","MH 01 AB 1026","MH 01 AB 1027","MH 01 AB 1028"]
 driver = User.where(:profile_title => "driver")
 28.times do
  vehicle = Vehicle.create!(:vehicle_make => vehicle_make.sample,
                             :vehicle_number => vehicle_number.shift,
                             :user_id => driver.shift.id )
 end


 28.times do |n|
  vehicle_data = VehicleData.create!(:registration_data => "ABDGCYDUD23455GHY#{n+1}",
                                      :purchase_date_and_year => Date.today,
                                      :owner_name => Faker::Name.name,
                                      :owner_address => Faker::Address.street_address,
                                      :vehicle_id => "#{n+1}" )
end
