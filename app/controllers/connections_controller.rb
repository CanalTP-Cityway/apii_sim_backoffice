class ConnectionsController < InheritedResources::Base
	belongs_to :stop

	def stop
		@stop ||= Stop.find params[:stop_id]  
  	end

	def collection
		@connections = Connection.where("stop_1_id = ? OR stop_2_id = ?", @stop.id, @stop.id)
	end

	private
	def permitted_params
		params.permit(:widget => [:stop_1_id, :stop_2_id, :distance, :duration, :prm_duration])
	end
end
