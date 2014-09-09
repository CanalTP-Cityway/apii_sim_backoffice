
namespace :demo do
  desc "populate data for bench"
  task :populate  => :environment  do
    [].tap do |mis_array|
      1.upto(5) do |index|
        modes_array = []
        modes_count = Random.new(  4).rand +1
        1.upto( modes_count ) do |r|
          modes_array << Random.new( 12).rand
        end
        mis_array << {name: "MIS#{index}",
                      comment: "Describing MIS#{index}",
                      api_url: "mis#{index}.org",
                      api_key: 'key1',
                      modes: Mode.where( id:  modes_array.uniq),
                      start_date: Time.now, end_date: Time.new('2030/12/31 23:59:59'),
                      multiple_starts_and_arrivals: 1, geographic_position_compliant: true}
      end
      Mis.create mis_array
    end

    Mis.all.each do |mis|
      [].tap do |stop_array|
        random = Random.new(1000)
        1.upto(30000) do |index|
          stop_array << {code: "#{index}-#{random.rand}" , mis_id: mis.id,
                         name: "STOP #{index} OF #{mis.name}",
                         administrative_code: random.rand,
                         quay_type: 'Quay',
                         lon: 1.5656 + random.rand/10000000.0,
                         lat: 48.0909 + random.rand/10000000.0 }
        end
        Stop.create stop_array
      end
    end

    puts "connections"
    stop_select_by_mis_id = {}
    Mis.all.each do |mis|
      stop_select_by_mis_id[mis.id] = mis.stops.first(20).map(&:id)
    end
    Mis.all.map(&:id).permutation(2).to_a.each do |couple|
      [].tap do |connection_array|
        random = Random.new(1000)
        1.upto(50) do |index|
          connection_array << { stop1_id: stop_select_by_mis_id[couple[0]][index%20],
                                stop2_id: stop_select_by_mis_id[couple[1]][index%20],
                                distance: random.rand,
                                duration: random.rand,
                                prm_duration: random.rand
          }
        end
        puts "connection_array #{connection_array.size} #{couple.inspect}"
        Connection.create connection_array
      end

    end
  end

end

