
  puts "Putting some app specific seed data to speed up development"
  puts "Generating Users ..."
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
 vehicle_make = ["Tata", "Maruti Suzuki", "Toyota", "Honda","Mahindra", "hyundai", "General Motor"]
 vehicle_number = ["MH 01 AB 1001", "MH 01 AB 1002","MH 01 AB 1003","MH 01 AB 1004","MH 01 AB 1005","MH 01 AB 1006","MH 01 AB 1007","MH 01 AB 1008","MH 01 AB 1009","MH 01 AB 1010","MH 01 AB 1011","MH 01 AB 1012","MH 01 AB 1013","MH 01 AB 1014","MH 01 AB 1015","MH 01 AB 1016","MH 01 AB 1017","MH 01 AB 1017","MH 01 AB 1018","MH 01 AB 1019","MH 01 AB 1020","MH 01 AB 1021","MH 01 AB 1022","MH 01 AB 1023","MH 01 AB 1024","MH 01 AB 1025","MH 01 AB 1026","MH 01 AB 1027","MH 01 AB 1028"]
 28.times do
  vehicle = Vehicle.create!(:vehicle_make => vehicle_make.sample,
                             :vehicle_number => vehicle_number.shift,
                             :user_id =>(1...28).sort_by{rand}[1] )
 end
