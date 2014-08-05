
namespace :demo do
  desc "populate data for demo"
  task :populate  => :environment  do

miss = Mis.create([{name: 'MIS1', comment: 'Describing MIS1', api_url: 'mis1.org', api_key: 'key1', start_date: Time.now, end_date: Time.new('2030/12/31 23:59:59'), multiple_start_and_arrivals: 1, geographic_position_compliant: true},
                              {name: 'MIS2', comment: 'Describing MIS2', api_url: 'mis2.org', api_key: 'key2', start_date: Time.now, end_date: Time.new('2030/12/31 23:59:59'), multiple_start_and_arrivals: 1, geographic_position_compliant: true},
                              {name: 'MIS3', comment: 'Describing MIS3', api_url: 'mis3.org', api_key: 'key3', start_date: Time.now, end_date: Time.new('2030/12/31 23:59:59'), multiple_start_and_arrivals: 1, geographic_position_compliant: true},
                              {name: 'MIS4', comment: 'Describing MIS4', api_url: 'mis4.org', api_key: 'key4', start_date: Time.now, end_date: Time.new('2030/12/31 23:59:59'), multiple_start_and_arrivals: 1, geographic_position_compliant: true},
                              {name: 'MIS5', comment: 'Describing MIS5', api_url: 'mis5.org', api_key: 'key5', start_date: Time.now, end_date: Time.new('2030/12/31 23:59:59'), multiple_start_and_arrivals: 1, geographic_position_compliant: true}])

miss[0].modes << Mode.where( :id => [3, 5, 12])
miss[1].modes << Mode.where( :id => [1, 2, 7, 9])
miss[2].modes << Mode.where( :id => [3, 4, 10, 11, 12])
miss[3].modes << Mode.where( :id => [3, 5, 12])
miss[4].modes << Mode.where( :id => [3, 5, 12])

stops = Stop.create([{code: 1, mis_id: miss[0].id, name: 'STOP 1 OF MIS 1', administrative_code: 'code 1 1', parent_id: 1, quay_type: 'quay 1', lat: 1.5656, lon: 48.0909 },
                     {code: 2, mis_id: miss[0].id, name: 'STOP 2 OF MIS 1', administrative_code: 'code 1 1', parent_id: 1, quay_type: 'quay 1', lat: 1.5657, lon: 48.0909 },
                     {code: 3, mis_id: miss[0].id, name: 'STOP 3 OF MIS 1', administrative_code: 'code 1 1', parent_id: 1, quay_type: 'quay 1', lat: 1.5658, lon: 48.0909 },
                     {code: 4, mis_id: miss[0].id, name: 'STOP 4 OF MIS 1', administrative_code: 'code 1 1', parent_id: 1, quay_type: 'quay 1', lat: 1.5659, lon: 48.0909 },
                     {code: 5, mis_id: miss[0].id, name: 'STOP 5 OF MIS 1', administrative_code: 'code 1 1', parent_id: 1, quay_type: 'quay 1', lat: 1.5660, lon: 48.0909 },
                     {code: 6, mis_id: miss[0].id, name: 'STOP 6 OF MIS 1', administrative_code: 'code 2 1', parent_id: 1, quay_type: 'quay 1', lat: 1.5661, lon: 48.0909 },
                     {code: 7, mis_id: miss[0].id, name: 'STOP 7 OF MIS 1', administrative_code: 'code 2 1', parent_id: 1, quay_type: 'quay 1', lat: 1.5662, lon: 48.0909 },
                     {code: 8, mis_id: miss[0].id, name: 'STOP 8 OF MIS 1', administrative_code: 'code 2 1', parent_id: 1, quay_type: 'quay 1', lat: 1.5663, lon: 48.0909 },
                     {code: 9, mis_id: miss[0].id, name: 'STOP 9 OF MIS 1', administrative_code: 'code 2 1', parent_id: 1, quay_type: 'quay 1', lat: 1.5664, lon: 48.0909 },
                     {code: 10, mis_id: miss[0].id, name: 'STOP 10 OF MIS 1', administrative_code: 'code 2 1', parent_id: 1, quay_type: 'quay 1', lat: 1.5665, lon: 48.0909 },
                     {code: 1, mis_id: miss[1].id, name: 'STOP 1 OF MIS 2', administrative_code: 'code 1 2', parent_id: 1, quay_type: 'quay 1', lat: 1.5666, lon: 48.0909 },
                     {code: 2, mis_id: miss[1].id, name: 'STOP 2 OF MIS 2', administrative_code: 'code 1 2', parent_id: 1, quay_type: 'quay 1', lat: 1.5667, lon: 48.0909 },
                     {code: 3, mis_id: miss[1].id, name: 'STOP 3 OF MIS 2', administrative_code: 'code 1 2', parent_id: 1, quay_type: 'quay 1', lat: 1.5668, lon: 48.0909 },
                     {code: 4, mis_id: miss[1].id, name: 'STOP 4 OF MIS 2', administrative_code: 'code 1 2', parent_id: 1, quay_type: 'quay 1', lat: 1.5669, lon: 48.0909 },
                     {code: 5, mis_id: miss[1].id, name: 'STOP 5 OF MIS 2', administrative_code: 'code 1 2', parent_id: 1, quay_type: 'quay 1', lat: 1.5670, lon: 48.0909 },
                     {code: 6, mis_id: miss[1].id, name: 'STOP 6 OF MIS 2', administrative_code: 'code 2 2', parent_id: 1, quay_type: 'quay 1', lat: 1.5671, lon: 48.0909 },
                     {code: 7, mis_id: miss[1].id, name: 'STOP 7 OF MIS 2', administrative_code: 'code 2 2', parent_id: 1, quay_type: 'quay 1', lat: 1.5672, lon: 48.0909 },
                     {code: 8, mis_id: miss[1].id, name: 'STOP 8 OF MIS 2', administrative_code: 'code 2 2', parent_id: 1, quay_type: 'quay 1', lat: 1.5673, lon: 48.0909 },
                     {code: 9, mis_id: miss[1].id, name: 'STOP 9 OF MIS 2', administrative_code: 'code 2 2', parent_id: 1, quay_type: 'quay 1', lat: 1.5674, lon: 48.0909 },
                     {code: 10, mis_id: miss[1].id, name: 'STOP 10 OF MIS 2', administrative_code: 'code 2 2', parent_id: 1, quay_type: 'quay 1', lat: 1.5675, lon: 48.0909 },
                     {code: 1, mis_id: miss[2].id, name: 'STOP 1 OF MIS 3', administrative_code: 'code 1 3', parent_id: 1, quay_type: 'quay 1', lat: 1.5676, lon: 48.0909 },
                     {code: 2, mis_id: miss[2].id, name: 'STOP 2 OF MIS 3', administrative_code: 'code 1 3', parent_id: 1, quay_type: 'quay 1', lat: 1.5677, lon: 48.0909 },
                     {code: 3, mis_id: miss[2].id, name: 'STOP 3 OF MIS 3', administrative_code: 'code 1 3', parent_id: 1, quay_type: 'quay 1', lat: 1.5678, lon: 48.0909 },
                     {code: 4, mis_id: miss[2].id, name: 'STOP 4 OF MIS 3', administrative_code: 'code 1 3', parent_id: 1, quay_type: 'quay 1', lat: 1.5679, lon: 48.0909 },
                     {code: 5, mis_id: miss[2].id, name: 'STOP 5 OF MIS 3', administrative_code: 'code 1 3', parent_id: 1, quay_type: 'quay 1', lat: 1.5680, lon: 48.0909 },
                     {code: 6, mis_id: miss[2].id, name: 'STOP 6 OF MIS 3', administrative_code: 'code 2 3', parent_id: 1, quay_type: 'quay 1', lat: 1.5681, lon: 48.0909 },
                     {code: 7, mis_id: miss[2].id, name: 'STOP 7 OF MIS 3', administrative_code: 'code 2 3', parent_id: 1, quay_type: 'quay 1', lat: 1.5682, lon: 48.0909 },
                     {code: 8, mis_id: miss[2].id, name: 'STOP 8 OF MIS 3', administrative_code: 'code 2 3', parent_id: 1, quay_type: 'quay 1', lat: 1.5683, lon: 48.0909 },
                     {code: 9, mis_id: miss[2].id, name: 'STOP 9 OF MIS 3', administrative_code: 'code 2 3', parent_id: 1, quay_type: 'quay 1', lat: 1.5684, lon: 48.0909 },
                     {code: 10, mis_id: miss[2].id, name: 'STOP 10 OF MIS 3', administrative_code: 'code 2 3', parent_id: 1, quay_type: 'quay 1', lat: 1.5685, lon: 48.0909 },
                     {code: 1, mis_id: miss[3].id, name: 'STOP 1 OF MIS 4', administrative_code: 'code 1 4', parent_id: 1, quay_type: 'quay 1', lat: 1.5686, lon: 48.0909 },
                     {code: 2, mis_id: miss[3].id, name: 'STOP 2 OF MIS 4', administrative_code: 'code 1 4', parent_id: 1, quay_type: 'quay 1', lat: 1.5687, lon: 48.0909 },
                     {code: 3, mis_id: miss[3].id, name: 'STOP 3 OF MIS 4', administrative_code: 'code 1 4', parent_id: 1, quay_type: 'quay 1', lat: 1.5688, lon: 48.0909 },
                     {code: 4, mis_id: miss[3].id, name: 'STOP 4 OF MIS 4', administrative_code: 'code 1 4', parent_id: 1, quay_type: 'quay 1', lat: 1.5689, lon: 48.0909 },
                     {code: 5, mis_id: miss[3].id, name: 'STOP 5 OF MIS 4', administrative_code: 'code 1 4', parent_id: 1, quay_type: 'quay 1', lat: 1.5690, lon: 48.0909 },
                     {code: 6, mis_id: miss[3].id, name: 'STOP 6 OF MIS 4', administrative_code: 'code 2 4', parent_id: 1, quay_type: 'quay 1', lat: 1.5691, lon: 48.0909 },
                     {code: 7, mis_id: miss[3].id, name: 'STOP 7 OF MIS 4', administrative_code: 'code 2 4', parent_id: 1, quay_type: 'quay 1', lat: 1.5692, lon: 48.0909 },
                     {code: 8, mis_id: miss[3].id, name: 'STOP 8 OF MIS 4', administrative_code: 'code 2 4', parent_id: 1, quay_type: 'quay 1', lat: 1.5693, lon: 48.0909 },
                     {code: 9, mis_id: miss[3].id, name: 'STOP 9 OF MIS 4', administrative_code: 'code 2 4', parent_id: 1, quay_type: 'quay 1', lat: 1.5694, lon: 48.0909 },
                     {code: 10, mis_id: miss[3].id, name: 'STOP 10 OF MIS 4', administrative_code: 'code 2 4', parent_id: 1, quay_type: 'quay 1', lat: 1.5695, lon: 48.0909 },
                     {code: 1, mis_id: miss[4].id, name: 'STOP 1 OF MIS 5', administrative_code: 'code 1 5', parent_id: 1, quay_type: 'quay 1', lat: 1.5696, lon: 48.0909 },
                     {code: 2, mis_id: miss[4].id, name: 'STOP 2 OF MIS 5', administrative_code: 'code 1 5', parent_id: 1, quay_type: 'quay 1', lat: 1.5697, lon: 48.0909 },
                     {code: 3, mis_id: miss[4].id, name: 'STOP 3 OF MIS 5', administrative_code: 'code 1 5', parent_id: 1, quay_type: 'quay 1', lat: 1.5698, lon: 48.0909 },
                     {code: 4, mis_id: miss[4].id, name: 'STOP 4 OF MIS 5', administrative_code: 'code 1 5', parent_id: 1, quay_type: 'quay 1', lat: 1.5699, lon: 48.0909 },
                     {code: 5, mis_id: miss[4].id, name: 'STOP 5 OF MIS 5', administrative_code: 'code 1 5', parent_id: 1, quay_type: 'quay 1', lat: 1.5600, lon: 48.0909 },
                     {code: 6, mis_id: miss[4].id, name: 'STOP 6 OF MIS 5', administrative_code: 'code 2 5', parent_id: 1, quay_type: 'quay 1', lat: 1.5601, lon: 48.0909 },
                     {code: 7, mis_id: miss[4].id, name: 'STOP 7 OF MIS 5', administrative_code: 'code 2 5', parent_id: 1, quay_type: 'quay 1', lat: 1.5602, lon: 48.0909 },
                     {code: 8, mis_id: miss[4].id, name: 'STOP 8 OF MIS 5', administrative_code: 'code 2 5', parent_id: 1, quay_type: 'quay 1', lat: 1.5603, lon: 48.0909 },
                     {code: 9, mis_id: miss[4].id, name: 'STOP 9 OF MIS 5', administrative_code: 'code 2 5', parent_id: 1, quay_type: 'quay 1', lat: 1.5604, lon: 48.0909 },
                     {code: 10, mis_id: miss[4].id, name: 'STOP 10 OF MIS 5', administrative_code: 'code 2 5', parent_id: 1, quay_type: 'quay 1', lat: 1.5605, lon: 48.0909 }
                     ])

  end

end

