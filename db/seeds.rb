# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

modes = Mode.create([{mode_code: 'BUS', mode_description: 'Bus'},
                     {mode_code: 'TROLLEYBUS', mode_description: 'Trolleyus'},
                     {mode_code: 'TRAM', mode_description: 'Tramway'},
                     {mode_code: 'COACH', mode_description: 'Coach'},
                     {mode_code: 'RAIL', mode_description: 'Trains and other rail vehicles'},
                     {mode_code: 'INTERCITYRAIL', mode_description: 'Long distance rails'},
                     {mode_code: 'URBANRAIL', mode_description: 'Short distance rails'},
                     {mode_code: 'METRO', mode_description: 'Underground'},
                     {mode_code: 'AIR', mode_description: 'Plains nd helicopters'},
                     {mode_code: 'WATER', mode_description: 'Boats and ...'},
                     {mode_code: 'CABLE', mode_description: 'Cable ...'},
                     {mode_code: 'FUNICULAR', mode_description: 'Funicular'},
                     {mode_code: 'TAXI', mode_description: 'Taxi'},
                     {mode_code: 'BIKE', mode_description: 'bicycle'},
                     {mode_code: 'CAR', mode_description: 'Private car'}])
