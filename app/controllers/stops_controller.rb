# -*- coding: utf-8 -*-
class StopsController < InheritedResources::Base
	actions :index, :show

	respond_to :html
  respond_to :kml, :only => [:index, :show]
	respond_to :js, :only => :index

  def index
    super do |format|      
      # add this line to respond to format kml using your renderer
      format.kml {
        render 'map_layers/stops'
      }
    end
  end
  
  
  def show    
    super do |format|      
      @map = map("/stops/#{resource.id}.kml")
      format.kml { render 'map_layers/stop' }
    end
  end

  protected

  alias_method :stop, :resource
  alias_method :stops, :collection
  
  def collection
    ransack_params = params[:q]
    puts ransack_params.inspect
    
    # Hack to delete params can't be used by ransack
    if ransack_params.present?
      if ransack_params["origin"].present? && ransack_params["distance"].present?
        origin = Stop.geos_factory.parse_wkt( "POINT(#{ransack_params["origin"].gsub(",", " ")})" )
        distance = ransack_params["distance"].to_i * ( 0.001 / 111 )       
      end

      having_connection = ransack_params["having_connection"]

      ransack_params.delete_if {|key, value| ["origin", "distance", "having_connection"].include?(key) } 
    end

    selected_stops = if origin && distance && having_connection
                       Stop.near_from(origin, distance)
                     elsif having_connection
                       Stop.all
                     elsif origin && distance
                       Stop.near_from(origin, distance)                       
                     else
                       Stop.all
                     end
    @q = selected_stops.search(params[:q])
    @stops ||= @q.result(:distinct => true).order(:name).limit(20)
  end
  
  private
  
  def permitted_params
    params.permit(:stop => [:code, :mis_id, :name, :type, :administrative_code, :site_ref, :transport_mode, :quay_type, :geometry])
  end
  
  def map(url)
    @map = MapLayers::JsExtension::MapBuilder.new("map") do |builder, page|
      # OpenStreetMap layer
      page << builder.map.add_layer(MapLayers::OpenLayers::OSM_MAPNIK)

      # Add a button to hide/show layers
      page << builder.map.add_control(MapLayers::OpenLayers::Control::LayerSwitcher.new)

      # Add mouse coordinates
      page << builder.map.add_control(MapLayers::OpenLayers::Control::MousePosition.new)

      # Add a vector layer to read from kml url
      page << builder.add_vector_layer('stop', url, :format => :kml)
      page << builder.add_vector_layer('stop', "/stops/#{resource.id}/connections.kml", :format => :kml)
      
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
