class ModesController < InheritedResources::Base
	# Inherited actions
	#actions :index, :show, :new, :create

    # The Mime types
	#respond_to :html, :xml, :json
	#respond_to :js, :only => :create
	#respond_to :iphone, :except => [ :edit, :update ]

	private
	def permitted_params
		params.permit(:widget => [:mode_code, :mode_description])
	end
end
