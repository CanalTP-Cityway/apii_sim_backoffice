class StopSearchesController < InheritedResources::Base
	defaults :resource_class => StopSearch

	def create
		create! do |success, failure|
			success.html {render :index}
		end
		Rails.logger.error "Appel create, resource = #{resource.inspect}"
	end

	protected
	def collection
		@stop_search = StopSearch.new
	end

	def create_resource (object)
		Rails.logger.error "OBJECT = #{object.inspect}"
		#object.results
        ## don't call save on object
        ## To raise errors before the view
		#resource.results
	end

	def resource
      	Rails.logger.error "Appel resource"
      	@stop_search = StopSearch.new(params[:stop_search])
    end		


	private
	def permitted_params
		params.permit(:stop_search => [:stop_name, :postal_code, :administrative_code, :stop_code, :stop_id, :neighbour_stop_id, :mis_id, :has_transition])
	end
end
