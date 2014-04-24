class MiSystemsController < InheritedResources::Base

	private
	def permitted_params
		params.permit(:widget => [:name, :comment, :api_url, :api_key, :start_date, :end_date, :multiple_starts_and_arrivals])
	end
end
