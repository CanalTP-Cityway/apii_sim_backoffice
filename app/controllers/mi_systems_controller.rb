class MiSystemsController < InheritedResources::Base

  def show
    @map = map
    show!
  end 
  
	private
  
	def permitted_params
		params.permit(mi_system: [:name, :comment, :api_url, :api_key, :start_date, :end_date, :multiple_starts_and_arrivals])
	end

  def map
    MapLayers::JsExtension::MapBuilder.new("map") do |builder, page|
      # Add a button to hide/show layers
      page << builder.map.add_control(MapLayers::OpenLayers::Control::LayerSwitcher.new)

      # Add a link for permanent url
      page << builder.map.add_control(MapLayers::OpenLayers::Control::Permalink.new('permalink'))

      # Add mouse coordinates
      page << builder.map.add_control(MapLayers::OpenLayers::Control::MousePosition.new)

      # Add a vector layer to read from kml url
      page << builder.add_vector_layer('stop', '/stops.kml', :format => :kml)
              
      # Initialize select, point, path, polygon and drag control for features
      # you may want to handle event on only one layer
      #page << builder.map_handler.initialize_controls('map_controls', 'pikts')
      # if you need to handle events on multiple layers, add all theses layers to the initializer
      # drag events and draw (point, path, polygon) events only works on the first layer, in this case 'pikts'
      page << builder.map_handler.initialize_controls('map_controls', ['stop'])

      # Switch control mode, 'select' display popup on feature
      # available mode are :
      #   - select, to display popup
      #   - point, to create points on map
      #   - path, to draw path on map
      #   - polygon, to draw polygons on map
      #   - drag, to move features
      #   - none, to disable all controls
      page << builder.map_handler.toggle_control('map_controls', 'select')

      page << builder.map.zoom_to_max_extent()
    end
  end
end
