class StopSearchesController < InheritedResources::Base
	defaults :resource_class => StopSearch, :collection_name => 'found_stops', :instance_name => 'found_stop'

	protected
	def collection
		@found_stops ||= end_of_association_chain.paginate(:page => params[:page])
	end
end
