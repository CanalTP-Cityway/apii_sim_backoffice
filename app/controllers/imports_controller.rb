class ImportsController < InheritedResources::Base
  actions :index
  
  respond_to :html
  respond_to :json
  
  protected
  alias_method :import, :resource
  alias_method :imports, :collection
  
  def collection
    @imports_count = Import.all.count
    @imports = Import.all.order(:start_date).reverse_order.limit(20)
  end
  
  private
  
  def permitted_params
    params.permit(:import => [:id, :start_date, :end_date, :result, :nb_stops, :nb_new_stops, :nb_updated_stops, :nb_deleted_stops, :nb_transfers, :nb_new_transfers, :nb_updated_transfers, :nb_deleted_transfers, :nb_mis_connections, :nb_new_mis_connections, :nb_deleted_mis_connections])
  end
  
end
