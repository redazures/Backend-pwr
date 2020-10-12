# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# User.create(name: "Cindy", title:"Doctor", email:"cindy@gmail.com",password:"12345",employee_id:rand(1000...9999))
# User.create(name: "Rosanna", title:"Nurse", email:"roro@gmail.com",password:"12345",employee_id:rand(1000...9999))
# User.create(name: "Coco", title:"Therapist", email:"coco@gmail.com",password:"12345",employee_id:rand(1000...9999))
# User.create(name: "Kevin", title:"Analyst and Therapist", email:"KevX@gmail.com", password:"12345",employee_id:rand(1000...9999))
# User.create(name: "Stan", title:"X-Ray Tech", email:"Stanley@gmail.com",password:"12345",employee_id:rand(1000...9999))

# mates="Rudy,Meghann,Ethan,Mike,Hollander,Stephen,Jules,Taevon,Catherine,steveD,greg,alexS,Tashawn,IanG,James,IanR,Jennifer,Alex,Junko,RyanW,Karan,SeMin,JakeL,Brian,Devin,Muhtasim,Josh,DavidKir,Amit,JakeM,Victor,Kevin,RyanF,Vincent,DavidK,Ward,Codyd,RyanL,Matthew,Gregory,Codyc,Mimi,Minelie,Joseph,Samuel,Sawandi,Iuri,Jzavier,Israel,Vlad,Teddy"
# mates=mates.split(",")
# mates.each{|u|Patient.create(name:u, current: false, hospital_patient_id:rand(1000..9999))}


10.times do 
    patient =Patient.all.sample
    patient.current = true
    patient.save!
    Ledger.create(user_id:User.all.sample.id, patient_id:patient.id,current_room:rand(100..999),description:"#{patient.name} has entered the hospital and is waiting for the doctor to eval")
end

puts User.count
puts Patient.count
puts Ledger.count