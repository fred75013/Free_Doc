# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
Specialty.destroy_all
Joindoctorspecialty.destroy_all

15.times do 
  Specialty.create!(
    specialty: ["Anatomo-pathologie", "Anesthésie-réanimation", "Biologie médicale", "Cardiologie", "Chirurgie", "Psychiatrie adulte", "Psychiatrie infanto-juvénile", "Radiothérapie", "Radiologie", "Rhumatologie", "Stomatologie", "Urologie"].sample
  )
end

20.times do 
  city = City.create!(
    city: Faker::Address.city
  )
end

20.times do
  city = City.all.sample
  d = Doctor.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    zip_code: Faker::Address.zip_code,
    city: city
  )
end

50.times do
  city = City.all.sample
  patient = Patient.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: city
  )
end

100.times do 
  d = Doctor.all.sample
  pa = Patient.all.sample
  c = City.all.sample
  if d.city == pa.city
    c = d.city
    Appointment.create!(
    doctor: d,
    patient: pa,
    city: c,
    date: Faker::Date.between(from: '1990-09-23', to: '2020-09-25') 
    )
  else
    Appointment.create!(
    doctor: d,
    patient: pa,
    city: d.city,
    date: Faker::Date.between(from: '1990-09-23', to: '2020-09-25') 
    )
  end
end

20.times do 
  doctor = Doctor.all.sample
  specialty = Specialty.all.sample
 Joindoctorspecialty.create(doctor: doctor,  specialty: specialty)
end