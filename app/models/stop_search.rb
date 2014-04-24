class StopSearch 
	include ActiveModel::Model
	attr_accessor :stop_name, :postal_code, :administrative_code
	attr_accessor :stop_code, :stop_id, :neighbour_stop_id
	attr_accessor :mis_id, :has_transition

	def persisted?  
	    false  
	end
end
