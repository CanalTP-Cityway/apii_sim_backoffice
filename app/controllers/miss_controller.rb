class MissController < InheritedResources::Base
  respond_to :html
  respond_to :kml, :only => :show
  respond_to :json
  defaults :resource_class => Mis, :collection_name => 'miss', :instance_name => 'mis'
  
  def show    
    super do |format|
      @map = map("/miss/#{resource.id}/stops.kml")
      format.kml { render 'map_layers/stops' }
    end
  end 
  
  def connections
    @mis = Mis.find(params[:id])
    @connections = @mis.connections
  end
  
  def stops
    @mis = Mis.find(params[:id])
    @stops = @mis.stops.page(params[:page])
  end

  protected
  
  alias_method :mis, :resource
  alias_method :miss, :collection
  
  def collection
    @q = params[:q].present? ? Mis.search(params[:q]) : Mis.all
    @miss ||= params[:q].present? ? @q.result(:distinct => true).first(20) : @q.first(20)
  end
  
  private
  
  def permitted_params
    params.permit(mis: [:name, :comment, :api_url, :api_key, :start_date, :end_date, :multiple_starts_and_arrivals])
  end
  
  def map(url)
    MapLayers::JsExtension::MapBuilder.new("map") do |builder, page|
      # OpenStreetMap layer
      page << builder.map.add_layer(MapLayers::OpenLayers::OSM_MAPNIK)

      # Add a button to hide/show layers
      page << builder.map.add_control(MapLayers::OpenLayers::Control::LayerSwitcher.new)

      # Add mouse coordinates
      page << builder.map.add_control(MapLayers::OpenLayers::Control::MousePosition.new)

      # Add a vector layer to read from kml url
      page << builder.add_vector_layer('stops', url, :format => :kml)
      
      # Add an empty vector layer
      #page << builder.add_vector_layer('connections', '/miss/#{mis.id}/connections.kml', :format => :kml)              
      
      # Initialize select, point, path, polygon and drag control for features
      # you may want to handle event on only one layer
      #page << builder.map_handler.initialize_controls('map_controls', 'pikts')
      # if you need to handle events on multiple layers, add all theses layers to the initializer
      # drag events and draw (point, path, polygon) events only works on the first layer, in this case 'pikts'
      page << builder.map_handler.initialize_controls('map_controls', ['stops', 'connections'])

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
