# kml builder
xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.kml(:xmlns=>"http://earth.google.com/kml/2.2") do
  xml.Document do
    xml.name "#{@stops.class.to_s}_collection"

    # styles examples
    xml.StyleMap :id => "mis_destination" do
      xml.Pair do
        xml.key "normal"
        xml.styleUrl "#mis_destination_normal"
      end
      xml.Pair do
        xml.key "highlight"
        xml.styleUrl "#mis_destination_highlight"
      end
    end

    xml.Style :id => "mis_destination_normal" do
      xml.IconStyle do
        xml.scale "1.2"
        xml.Icon do
          xml.href "http://maps.google.com/mapfiles/kml/paddle/red-circle.png"
        end
        xml.hotSpot :x => "0.5", :y => "0.5", :xunits => "fraction", :yunits => "fraction"
      end
      xml.LabelStyle do
        xml.color "ff00aaff"
      end
    end

    xml.Style :id => "mis_destination_highlight" do
      xml.IconStyle do
        xml.scale "1.4"
        xml.Icon do
          xml.href "http://maps.google.com/mapfiles/kml/paddle/red-circle.png"
        end
        xml.hotSpot :x => "0.5", :y => "0.5", :xunits => "fraction", :yunits => "fraction"
      end
      xml.LabelStyle do
        xml.color "ff00aaff"
      end
    end

    # styles examples
    xml.StyleMap :id => "mis_origin" do
      xml.Pair do
        xml.key "normal"
        xml.styleUrl "#mis_origin_normal"
      end
      xml.Pair do
        xml.key "highlight"
        xml.styleUrl "#mis_origin_highlight"
      end
    end

    xml.Style :id => "mis_origin_normal" do
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

    xml.Style :id => "mis_origin_highlight" do
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

    # styles examples
    xml.StyleMap :id => "transition_origin" do
      xml.Pair do
        xml.key "normal"
        xml.styleUrl "#transition_origin_normal"
      end
      xml.Pair do
        xml.key "highlight"
        xml.styleUrl "#transition_origin_highlight"
      end
    end

    xml.Style :id => "transition_origin_normal" do
      xml.IconStyle do
        xml.scale "1.2"
        xml.Icon do
          xml.href "http://maps.google.com/mapfiles/kml/pushpin/grn-pushpin.png"
        end
        xml.hotSpot :x => "0.5", :y => "0.5", :xunits => "fraction", :yunits => "fraction"
      end
      xml.LabelStyle do
        xml.color "ff00aaff"
      end
    end

    xml.Style :id => "transition_origin_highlight" do
      xml.IconStyle do
        xml.scale "1.4"
        xml.Icon do
          xml.href "http://maps.google.com/mapfiles/kml/pushpin/grn-pushpin.png"
        end
        xml.hotSpot :x => "0.5", :y => "0.5", :xunits => "fraction", :yunits => "fraction"
      end
      xml.LabelStyle do
        xml.color "ff00aaff"
      end
    end

    # styles examples
    xml.StyleMap :id => "transition_destination" do
      xml.Pair do
        xml.key "normal"
        xml.styleUrl "#transition_destination_normal"
      end
      xml.Pair do
        xml.key "highlight"
        xml.styleUrl "#transition_destination_highlight"
      end
    end

    xml.Style :id => "transition_destination_normal" do
      xml.IconStyle do
        xml.scale "1.2"
        xml.Icon do
          xml.href "http://maps.google.com/mapfiles/kml/pushpin/red-pushpin.png"
        end
        xml.hotSpot :x => "0.5", :y => "0.5", :xunits => "fraction", :yunits => "fraction"
      end
      xml.LabelStyle do
        xml.color "ff00aaff"
      end
    end

    xml.Style :id => "transition_destination_highlight" do
      xml.IconStyle do
        xml.scale "1.4"
        xml.Icon do
          xml.href "http://maps.google.com/mapfiles/kml/pushpin/red-pushpin.png"
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

      @stops.each do |stop|
        unless stop.lat.nil? || stop.lon.nil?
          xml.Placemark do
            # id
            xml.id "#{dom_id(stop)}"

            # place name
            name = stop.respond_to?('name') ? stop.name : "#{dom_id(stop)}"
            xml.name "#{name}"

            # place description
            #xml.description do
            #  xml.cdata! "#{stop.description}"
            #end

            # popup url
            xml.popup_content_url polymorphic_path([:popup_content, stop]) rescue nil

            style_prefix = (stop.in_transition? ? "transition" : "mis")
            style_suffix = (stop.origin_mis? ? "origin" : "destination")
            xml.styleUrl "##{style_prefix}_#{style_suffix}"
            #xml.styleUrl "##{stop.map_layers_marker}" if stop.respond_to?('map_layers_marker')

            # place link
            #xml.link browse_path(stop.url)

            # place geoloc
            altitude = stop.respond_to?('altitude') ? stop.altitude : 0
            xml.Point do
              xml.coordinates "#{stop.lon.to_f},#{stop.lat.to_f},#{altitude}"
            end
          end
        end
      end

    end


  end
end

