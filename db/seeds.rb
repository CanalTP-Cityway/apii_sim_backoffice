# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

modes = Mode.create([{code: 'BUS', description: 'Bus'},
                     {code: 'TROLLEYBUS', description: 'Trolleyus'},
                     {code: 'TRAM', description: 'Tramway'},
                     {code: 'COACH', description: 'Coach'},
                     {code: 'RAIL', description: 'Trains and other rail vehicles'},
                     {code: 'INTERCITYRAIL', description: 'Long distance rails'},
                     {code: 'URBANRAIL', description: 'Short distance rails'},
                     {code: 'METRO', description: 'Underground'},
                     {code: 'AIR', description: 'Plains nd helicopters'},
                     {code: 'WATER', description: 'Boats and ...'},
                     {code: 'CABLE', description: 'Cable ...'},
                     {code: 'FUNICULAR', description: 'Funicular'},
                     {code: 'TAXI', description: 'Taxi'},
                     {code: 'BIKE', description: 'bicycle'},
                     {code: 'CAR', description: 'Private car'}])
