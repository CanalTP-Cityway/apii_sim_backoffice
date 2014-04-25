class StopsController < InheritedResources::Base
	#actions :index, :show, :new, :create

	#respond_to :html, :xml, :json
	#respond_to :js, :only => :create
	#respond_to :iphone, :except => [ :edit, :update ]

	private
	def permitted_params
		params.permit(:widget => [:stop_code, :mi_system_id, :name, :type, :administrative_code, :site_ref, :transport_mode, :quay_type, :lat, :lon])
	end
end
