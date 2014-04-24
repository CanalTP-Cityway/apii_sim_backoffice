class StopSearchesController < InheritedResources::Base
	defaults :resource_class => StopSearch, :collection_name => 'found_stops', :instance_name => 'found_stop'

	protected
	def collection
		@found_stops ||= end_of_association_chain.paginate(:page => params[:page])
	end

	private
	def permitted_params
		params.permit(:widget => [:stop_name, :postal_code, :administrative_code, :stop_code, :stop_id, :neighbour_stop_id, :mis_id, :has_transition])
	end
end
