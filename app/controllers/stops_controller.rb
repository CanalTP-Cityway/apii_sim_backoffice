# -*- coding: utf-8 -*-
class StopsController < InheritedResources::Base
  actions :index, :show

  belongs_to :mis, :param => :miss_id, :parent_class => Mis, :optional => true

  respond_to :html
  respond_to :kml, :only => [:index, :show]
  respond_to :js, :only => :index
  respond_to :json

  def index
    if params["mis1_id"] && params["mis2_id"]
      @stops = Stop.couple_of_mis_stops( params["mis1_id"], params["mis2_id"])
      @map = map( stops_path( format: :kml ) + "?mis1_id=#{params["mis1_id"]}&mis2_id=#{params["mis2_id"]}")
    end
    super do |format|
      # add this line to respond to format kml using your renderer
      format.kml {
        render 'map_layers/stops'
      }
      format.json { render @stops.to_json }
    end
  end


  def show
    super do |format|
      @map = map( stop_path( resource, format: :kml ))
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
        str = ransack_params["origin"].gsub(',' , ' ').scan(/[\w\.]+/)
        if str.length == 2
          origin = Stop.geos_factory.parse_wkt( "POINT(#{str[1]} #{str[0]})" )
          distance = ransack_params["distance"].to_i * ( 0.001 / 111 )
        end
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
                       parent.present? ? parent.stops : Stop.all
                     end
    @q = selected_stops.search(params[:q])
    @stops ||= @q.result(:distinct => true).order(:name).limit(20)
  end

  private

  def permitted_params
    params.permit(:stop => [:code, :mis_id, :name, :administrative_code, :site_ref, :quay_type, :geometry])
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

      page << builder.add_vector_layer('stop', "/stops/#{resource.id}/connections.kml", :format => :kml) if @stop

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
