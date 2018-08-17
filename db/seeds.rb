# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require_relative '../app/models/area.rb'

LGAS = [
    'Alimosho',
    'Ajeromi-Ifelodun',
    'Kosofe',
    'Mushin',
    'Oshodi-Isolo',
    'Ojo',
    'Ikorodu',
    'Surulere',
    'Agege',
    'Ifako-Ijaiye',
    'Shomolu',
    'Amuwo-Odofin',
    'Lagos Mainland',
    'Ikeja Eti-Osa',
    'Badagry',
    'Apapa',
    'Lagos Island',
    'Ibeju-Lekki',
    'Epe'	
]

LGAS.each do |area_name|
    Area.create(name: area_name)
end