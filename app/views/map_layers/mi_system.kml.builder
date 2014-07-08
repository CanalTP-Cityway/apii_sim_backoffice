# kml builder
xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.kml(:xmlns=>"http://earth.google.com/kml/2.2") do
  xml.Document do
    xml.name "#{@mi_system.class.to_s}_collection"

    # styles examples
    xml.StyleMap :id => "sunny_icon_pair" do
      xml.Pair do
        xml.key "normal"
        xml.styleUrl "#sunny_icon_normal"
      end
      xml.Pair do
        xml.key "highlight"
        xml.styleUrl "#sunny_icon_highlight"
      end
    end

    xml.Style :id => "sunny_icon_normal" do
      xml.IconStyle do
        xml.scale "1.2"
        xml.Icon do
          xml.href "http://maps.google.com/mapfiles/kml/shapes/sunny.png"
        end
        xml.hotSpot :x => "0.5", :y => "0.5", :xunits => "fraction", :yunits => "fraction"
      end
      xml.LabelStyle do
        xml.color "ff00aaff"
      end
    end

    xml.Style :id => "sunny_icon_highlight" do
      xml.IconStyle do
        xml.scale "1.4"
        xml.Icon do
          xml.href "http://maps.google.com/mapfiles/kml/shapes/sunny.png"
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
      
      unless mi_system.envelope
        xml.Placemark do
          # id
          xml.id "#{dom_id(mi_system)}"
          
          # place name
          name = mi_system.respond_to?('name') ? mi_system.name : "#{dom_id(mi_system)}"
          xml.name "#{name}"
          
          # place description
          xml.description do
            xml.cdata! "#{mi_system.comment}"
          end

          # popup url
          #xml.popup_content_url polymorphic_path([:popup_content, mi_system]) rescue nil

          #xml.styleUrl "#sunny_icon_pair"
          #xml.styleUrl "##{mi_system.map_layers_marker}" if mi_system.respond_to?('map_layers_marker')

          # place link
          #xml.link browse_path(mi_system.url)

          # place geoloc
          xml.Polygon do
            xml.coordinates "#{mi_system.shape.x.to_f},#{mi_system.shape.y.to_f},#{altitude}"
          end
        end
      end
    end    
  end
end

