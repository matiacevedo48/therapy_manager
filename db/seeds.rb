# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'


CSV.foreach(Rails.root.join('db/seeds/specialties.csv'), headers: true, col_sep:";") do |row|
    Specialty.create! do |mode|
      mode.name = row[0]
      puts "#{mode.name} Guardada"
    end
    
  end
puts "Se ingresaron #{Specialty.count} registros en la tabla de Specialties"


CSV.foreach(Rails.root.join('db/seeds/users.csv'), headers: true, col_sep:";") do |row|
  
    u = User.create!(
      :email => row[0],
      :password => row[1],
      :username => row[2]
    )    
  UserSpecialty.create(user: u, specialty: Specialty.first)
  UserSpecialty.create(user: u, specialty: Specialty.second)
  Rating.create(user: u, rating: 5, comments: "regular")
  Rating.create(user: u, rating: 7, comments: "bueno")
  Rating.create(user: u, rating: 8, comments: "muy bueno")
end
puts "Se ingresaron #{User.count} registros en la tabla de Users"
i=0
CSV.foreach(Rails.root.join('db/seeds/patients.csv'), headers: true, col_sep:";") do |row|
  
  u = Patient.create(
    :name => row[0],
    :last_name => row[1],
    :rut => row[2],
    :phone_number => row[3],
    :email => row[4],
    :birthdate => row[5],
    :job => row[6],
    :civil_state => row[7],
    :family_info => row[8],
    :illness => row[9],
    :allergies => row[10],
    :surgery => row[11],
    :hobbies => row[12]
  )
  Attention.create(user: User.first, patient: u, therapy: "masaje", treatment: "pastillas", date: Date.today, time: Time.now, symptom: "dolor") if i.zero?
  i+=1
end
puts "Se ingresaron #{Patient.count} registros en la tabla de Patients"

ScheduleEvent.create(user: User.first, title: "titulo", description: "descripcion", start_date: Time.now, end_date: Time.now, patient: Patient.first)
ScheduleEvent.create(user: User.first, title: "titulo 2", description: "descripcion 2", start_date: Time.now, end_date: Time.now, patient: Patient.first)
