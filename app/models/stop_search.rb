class StopSearch 
  include ActiveModel::Model

  attr_accessor :stop_name, :postal_code, :administrative_code
  attr_accessor :code, :stop_id, :neighbour_stop_id, :neighbour_stop_code
  attr_accessor :mis_id, :mis_name, :has_transition
  
  def persisted?  
    false  
  end
  
  def results
    #@stops ||= Stop.searching(mis_id, stop_id, stop_name, administrative_code, postal_code, code, neighbour_stop_id, 0.0005, has_transition)
    args = { :stop_name => stop_name,
      :postal_code => postal_code,
      :administrative_code => administrative_code,
      :code => code,
      :stop_id => stop_id,
      :neighbour_stop_id => neighbour_stop_id,
      :neighbour_stop_code => neighbour_stop_code,
      :mis_name => mis_name,
      :mis_id => mis_id,
      :has_transition => has_transition,
      :dist => "0.0005"}
    @stops ||= Stop.searching(args)
  end
  
  
  #def collection
  #	@stops = Stop.page(params[:page])
  #end

end
