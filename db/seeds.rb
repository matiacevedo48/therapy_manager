# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Specialty.destroy_all

CSV.foreach(Rails.root.join('db/seeds/specialties.csv'), headers: true) do |row|
    Specialty.create! do |mode|
      mode.name = row[0]
      puts "#{mode.name} Guardada"
    end
    
  end
puts "Se ingresaron #{Specialty.count} registros en la tabla de Specialties"

Patient.destroy_all
User.destroy_all

CSV.foreach(Rails.root.join('db/seeds/users.csv'), headers: true) do |row|
    u = User.new(
      :email => row[0],
      :password => row[1],
      :username => row[2]
    )
    u.save!(:validate => false)
    
  end
puts "Se ingresaron #{User.count} registros en la tabla de Users"

CSV.foreach(Rails.root.join('db/seeds/patients.csv'), headers: true, col_sep:";") do |row|
    u = Patient.new(
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
    u.save!
  end
puts "Se ingresaron #{Patient.count} registros en la tabla de Patients"
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?