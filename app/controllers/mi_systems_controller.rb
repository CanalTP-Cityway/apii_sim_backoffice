class MiSystemsController < InheritedResources::Base

  def show
    @map = map
    show!
  end 
  
	private
	def permitted_params
		params.permit(:widget => [:name, :comment, :api_url, :api_key, :start_date, :end_date, :multiple_starts_and_arrivals])
	end

  def map
    MapLayers::JsExtension::MapBuilder.new("map") do |builder, page|
      page << builder.map.add_layer(MapLayers::OpenLayers::OSM_MAPNIK)
      page << builder.map.zoom_to_max_extent()
    end
  end
end
