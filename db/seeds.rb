# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

modes = Mode.create([{mode_code: 'MOD1', mode_description: 'Describing MOD1'},
                     {mode_code: 'MOD2', mode_description: 'Describing MOD2'},
                     {mode_code: 'MOD3', mode_description: 'Describing MOD3'},
                     {mode_code: 'MOD4', mode_description: 'Describing MOD4'},
                     {mode_code: 'MOD5', mode_description: 'Describing MOD5'},
                     {mode_code: 'MOD6', mode_description: 'Describing MOD6'},
                     {mode_code: 'MOD7', mode_description: 'Describing MOD7'},
                     {mode_code: 'MOD8', mode_description: 'Describing MOD8'}])

mi_systems = MiSystem.create([{name: 'MIS1', comment: 'Describing MIS1', api_url: 'mis1.org', api_key: 'key1', start_date: Time.now, end_date: Time.new('2030/12/31 23:59:59'), multiple_starts_and_arrivals: 1},
                              {name: 'MIS2', comment: 'Describing MIS2', api_url: 'mis2.org', api_key: 'key2', start_date: Time.now, end_date: Time.new('2030/12/31 23:59:59'), multiple_starts_and_arrivals: 1},
                              {name: 'MIS3', comment: 'Describing MIS3', api_url: 'mis3.org', api_key: 'key3', start_date: Time.now, end_date: Time.new('2030/12/31 23:59:59'), multiple_starts_and_arrivals: 1},
                              {name: 'MIS4', comment: 'Describing MIS4', api_url: 'mis4.org', api_key: 'key4', start_date: Time.now, end_date: Time.new('2030/12/31 23:59:59'), multiple_starts_and_arrivals: 1},
                              {name: 'MIS5', comment: 'Describing MIS5', api_url: 'mis5.org', api_key: 'key5', start_date: Time.now, end_date: Time.new('2030/12/31 23:59:59'), multiple_starts_and_arrivals: 1}])
