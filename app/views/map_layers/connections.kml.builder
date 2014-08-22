# kml builder
xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.kml(:xmlns=>"http://earth.google.com/kml/2.2") do
  xml.Document do
    xml.name "#{@connections.class.to_s}_collection"

    # styles examples
    xml.StyleMap :id => "connection_icon_pair" do
      xml.Pair do
        xml.key "normal"
        xml.styleUrl "#connection_icon_normal"
      end
      xml.Pair do
        xml.key "highlight"
        xml.styleUrl "#connection_icon_highlight"
      end
    end

    xml.Style :id => "connection_icon_normal" do
      xml.IconStyle do
        xml.scale "1.2"
        xml.Icon do
          xml.href "http://maps.google.com/mapfiles/kml/paddle/grn-circle.png"
        end
        xml.hotSpot :x => "0.5", :y => "0.5", :xunits => "fraction", :yunits => "fraction"
      end
      xml.LabelStyle do
        xml.color "ff00aaff"
      end
    end

    xml.Style :id => "connection_icon_highlight" do
      xml.IconStyle do
        xml.scale "1.4"
        xml.Icon do
          xml.href "http://maps.google.com/mapfiles/kml/paddle/grn-circle.png"
        end
        xml.hotSpot :x => "0.5", :y => "0.5", :xunits => "fraction", :yunits => "fraction"
      end
      xml.LabelStyle do
        xml.color "ff00aaff"
      end
    end

    #xml.Style ... your styles here

    xml.Folder do
      xml.name @folder_name

      @connections.each do |connection|
        unless connection.stop1.lat.nil? || connection.stop1.lon.nil? || connection.stop2.lat.nil? || connection.stop2.lon.nil?  
          xml.Placemark do
            # id
            xml.id "#{dom_id(connection)}"

            # place name
            # name = connection.respond_to?('name') ? connection.name : "#{dom_id(connection)}"
            # xml.name "#{name}"

            # place description
            #xml.description do
            #  xml.cdata! "#{connection.description}"
            #end

            # popup url
            # xml.popup_content_url polymorphic_path([:popup_content, connection]) rescue nil

            #xml.styleUrl "#connection_icon_pair"
            #xml.styleUrl "##{connection.map_layers_marker}" if connection.respond_to?('map_layers_marker')

            # place link
            #xml.link browse_path(connection.url)

            # place geoloc
            xml.LineString do
              xml.coordinates "#{connection.stop1.lon.to_f},#{connection.stop1.lat.to_f} #{connection.stop2.lon.to_f},#{connection.stop2.lat.to_f}" 
            end
          end
        end
      end

    end


  end
end

