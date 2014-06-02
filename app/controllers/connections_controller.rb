class ConnectionsController < InheritedResources::Base
	belongs_to :stop

	def collection
		@connections = Connection.where("stop_1_id = ? OR stop_2_id = ?", parent.id, parent.id)
	end

	private
	def permitted_params
		params.permit(:connection => [:stop_1_id, :stop_2_id, :distance, :duration, :prm_duration])
	end
end
	