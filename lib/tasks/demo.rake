
namespace :demo do
  desc "populate data for demo"
  task :populate  => :environment  do
modes = Mode.create([{mode_code: 'MOD1', mode_description: 'Describing MOD1'},
                     {mode_code: 'MOD2', mode_description: 'Describing MOD2'},
                     {mode_code: 'MOD3', mode_description: 'Describing MOD3'},
                     {mode_code: 'MOD4', mode_description: 'Describing MOD4'},
                     {mode_code: 'MOD5', mode_description: 'Describing MOD5'},
                     {mode_code: 'MOD6', mode_description: 'Describing MOD6'},
                     {mode_code: 'MOD7', mode_description: 'Describing MOD7'},
                     {mode_code: 'MOD8', mode_description: 'Describing MOD8'}])

mi_systems = MiSystem.create([{name: 'MIS1', comment: 'Describing MIS1', api_url: 'mis1.org', api_key: 'key1', start_date: Time.now, end_date: Time.new('2030/12/31 23:59:59'), multiple_starts_and_arrivals: 1, modes: modes[0,7]},
                              {name: 'MIS2', comment: 'Describing MIS2', api_url: 'mis2.org', api_key: 'key2', start_date: Time.now, end_date: Time.new('2030/12/31 23:59:59'), multiple_starts_and_arrivals: 1, modes: modes[2,6]},
                              {name: 'MIS3', comment: 'Describing MIS3', api_url: 'mis3.org', api_key: 'key3', start_date: Time.now, end_date: Time.new('2030/12/31 23:59:59'), multiple_starts_and_arrivals: 1, modes: modes[0,7]},
                              {name: 'MIS4', comment: 'Describing MIS4', api_url: 'mis4.org', api_key: 'key4', start_date: Time.now, end_date: Time.new('2030/12/31 23:59:59'), multiple_starts_and_arrivals: 1, modes: modes[2,2]},
                              {name: 'MIS5', comment: 'Describing MIS5', api_url: 'mis5.org', api_key: 'key5', start_date: Time.now, end_date: Time.new('2030/12/31 23:59:59'), multiple_starts_and_arrivals: 1, modes: modes[3,5]}])

stops = Stop.create([{stop_code: 1, mi_system_id: mi_systems[0].id, name: 'STOP 1 OF MIS 1', stop_type: 0, administrative_code: 'code 1 1', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 2, mi_system_id: mi_systems[0].id, name: 'STOP 2 OF MIS 1', stop_type: 0, administrative_code: 'code 1 1', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 3, mi_system_id: mi_systems[0].id, name: 'STOP 3 OF MIS 1', stop_type: 0, administrative_code: 'code 1 1', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 4, mi_system_id: mi_systems[0].id, name: 'STOP 4 OF MIS 1', stop_type: 0, administrative_code: 'code 1 1', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 5, mi_system_id: mi_systems[0].id, name: 'STOP 5 OF MIS 1', stop_type: 0, administrative_code: 'code 1 1', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 6, mi_system_id: mi_systems[0].id, name: 'STOP 6 OF MIS 1', stop_type: 0, administrative_code: 'code 2 1', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 7, mi_system_id: mi_systems[0].id, name: 'STOP 7 OF MIS 1', stop_type: 0, administrative_code: 'code 2 1', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 8, mi_system_id: mi_systems[0].id, name: 'STOP 8 OF MIS 1', stop_type: 0, administrative_code: 'code 2 1', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 9, mi_system_id: mi_systems[0].id, name: 'STOP 9 OF MIS 1', stop_type: 0, administrative_code: 'code 2 1', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 10, mi_system_id: mi_systems[0].id, name: 'STOP 10 OF MIS 1', stop_type: 0, administrative_code: 'code 2 1', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.099, lon: 1.566 },
                     {stop_code: 1, mi_system_id: mi_systems[1].id, name: 'STOP 1 OF MIS 2', stop_type: 0, administrative_code: 'code 1 2', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 2, mi_system_id: mi_systems[1].id, name: 'STOP 2 OF MIS 2', stop_type: 0, administrative_code: 'code 1 2', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 3, mi_system_id: mi_systems[1].id, name: 'STOP 3 OF MIS 2', stop_type: 0, administrative_code: 'code 1 2', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 4, mi_system_id: mi_systems[1].id, name: 'STOP 4 OF MIS 2', stop_type: 0, administrative_code: 'code 1 2', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 5, mi_system_id: mi_systems[1].id, name: 'STOP 5 OF MIS 2', stop_type: 0, administrative_code: 'code 1 2', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 6, mi_system_id: mi_systems[1].id, name: 'STOP 6 OF MIS 2', stop_type: 0, administrative_code: 'code 2 2', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 7, mi_system_id: mi_systems[1].id, name: 'STOP 7 OF MIS 2', stop_type: 0, administrative_code: 'code 2 2', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 8, mi_system_id: mi_systems[1].id, name: 'STOP 8 OF MIS 2', stop_type: 0, administrative_code: 'code 2 2', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 9, mi_system_id: mi_systems[1].id, name: 'STOP 9 OF MIS 2', stop_type: 0, administrative_code: 'code 2 2', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 10, mi_system_id: mi_systems[1].id, name: 'STOP 10 OF MIS 2', stop_type: 0, administrative_code: 'code 2 2', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.099, lon: 1.566 },
                     {stop_code: 1, mi_system_id: mi_systems[2].id, name: 'STOP 1 OF MIS 3', stop_type: 0, administrative_code: 'code 1 3', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 2, mi_system_id: mi_systems[2].id, name: 'STOP 2 OF MIS 3', stop_type: 0, administrative_code: 'code 1 3', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 3, mi_system_id: mi_systems[2].id, name: 'STOP 3 OF MIS 3', stop_type: 0, administrative_code: 'code 1 3', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 4, mi_system_id: mi_systems[2].id, name: 'STOP 4 OF MIS 3', stop_type: 0, administrative_code: 'code 1 3', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 5, mi_system_id: mi_systems[2].id, name: 'STOP 5 OF MIS 3', stop_type: 0, administrative_code: 'code 1 3', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 6, mi_system_id: mi_systems[2].id, name: 'STOP 6 OF MIS 3', stop_type: 0, administrative_code: 'code 2 3', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 7, mi_system_id: mi_systems[2].id, name: 'STOP 7 OF MIS 3', stop_type: 0, administrative_code: 'code 2 3', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 8, mi_system_id: mi_systems[2].id, name: 'STOP 8 OF MIS 3', stop_type: 0, administrative_code: 'code 2 3', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 9, mi_system_id: mi_systems[2].id, name: 'STOP 9 OF MIS 3', stop_type: 0, administrative_code: 'code 2 3', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 10, mi_system_id: mi_systems[2].id, name: 'STOP 10 OF MIS 3', stop_type: 0, administrative_code: 'code 2 3', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.099, lon: 1.566 },
                     {stop_code: 1, mi_system_id: mi_systems[3].id, name: 'STOP 1 OF MIS 4', stop_type: 0, administrative_code: 'code 1 4', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 2, mi_system_id: mi_systems[3].id, name: 'STOP 2 OF MIS 4', stop_type: 0, administrative_code: 'code 1 4', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 3, mi_system_id: mi_systems[3].id, name: 'STOP 3 OF MIS 4', stop_type: 0, administrative_code: 'code 1 4', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 4, mi_system_id: mi_systems[3].id, name: 'STOP 4 OF MIS 4', stop_type: 0, administrative_code: 'code 1 4', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 5, mi_system_id: mi_systems[3].id, name: 'STOP 5 OF MIS 4', stop_type: 0, administrative_code: 'code 1 4', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 6, mi_system_id: mi_systems[3].id, name: 'STOP 6 OF MIS 4', stop_type: 0, administrative_code: 'code 2 4', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 7, mi_system_id: mi_systems[3].id, name: 'STOP 7 OF MIS 4', stop_type: 0, administrative_code: 'code 2 4', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 8, mi_system_id: mi_systems[3].id, name: 'STOP 8 OF MIS 4', stop_type: 0, administrative_code: 'code 2 4', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 9, mi_system_id: mi_systems[3].id, name: 'STOP 9 OF MIS 4', stop_type: 0, administrative_code: 'code 2 4', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 10, mi_system_id: mi_systems[3].id, name: 'STOP 10 OF MIS 4', stop_type: 0, administrative_code: 'code 2 4', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.099, lon: 1.566 },
                     {stop_code: 1, mi_system_id: mi_systems[4].id, name: 'STOP 1 OF MIS 5', stop_type: 0, administrative_code: 'code 1 5', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 2, mi_system_id: mi_systems[4].id, name: 'STOP 2 OF MIS 5', stop_type: 0, administrative_code: 'code 1 5', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 3, mi_system_id: mi_systems[4].id, name: 'STOP 3 OF MIS 5', stop_type: 0, administrative_code: 'code 1 5', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 4, mi_system_id: mi_systems[4].id, name: 'STOP 4 OF MIS 5', stop_type: 0, administrative_code: 'code 1 5', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 5, mi_system_id: mi_systems[4].id, name: 'STOP 5 OF MIS 5', stop_type: 0, administrative_code: 'code 1 5', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 6, mi_system_id: mi_systems[4].id, name: 'STOP 6 OF MIS 5', stop_type: 0, administrative_code: 'code 2 5', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 7, mi_system_id: mi_systems[4].id, name: 'STOP 7 OF MIS 5', stop_type: 0, administrative_code: 'code 2 5', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 8, mi_system_id: mi_systems[4].id, name: 'STOP 8 OF MIS 5', stop_type: 0, administrative_code: 'code 2 5', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 9, mi_system_id: mi_systems[4].id, name: 'STOP 9 OF MIS 5', stop_type: 0, administrative_code: 'code 2 5', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.0909, lon: 1.5656 },
                     {stop_code: 10, mi_system_id: mi_systems[4].id, name: 'STOP 10 OF MIS 5', stop_type: 0, administrative_code: 'code 2 5', site_ref: 1, transport_mode: 'trans mode 1', quay_type: 'quay 1', lat: 48.099, lon: 1.566 }
                     ])

  end

end

