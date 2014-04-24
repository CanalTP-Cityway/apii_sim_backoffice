class ConnectionsController < InheritedResources::Base

	private
	def permitted_params
		params.permit(:widget => [:stop_1_id, :stop_2_id, :distance, :duration, :prm_duration])
	end
end
