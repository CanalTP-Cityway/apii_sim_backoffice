class ConnectionsController < InheritedResources::Base  
  custom_actions :resource => [:validate_connection, :invalidate_connection]
  
  belongs_to :stop, :mis, :polymorphic => true
  
  respond_to :kml, :only => :index
  
  def destroy
    destroy! { @stop }
  end

  def index
    super do |format|
      format.kml { render 'map_layers/connections' }
    end
  end 

  def collection
    @q = parent.present? ? parent.connections.search(params[:q]) : Connection.all.search(params[:q])
    @connections ||= 
      begin
        connections = @q.result(:distinct => true).order(:name)
        connections = connections.paginate(:page => params[:page], :per_page => @per_page) if @per_page.present?
        connections
      end
  end
  
  def invalidate_connection
    @connection = Connection.find params[:id]
    @connection.active = false
    @connection.save
    redirect_to stop_path(params[:stop_id])
  end
  
  def validate_connection
    @connection = Connection.find params[:id]
    @connection.active = true
    @connection.save
    redirect_to stop_path(params[:stop_id])
  end
  
  private
  def permitted_params
    params.permit(:connection => [:stop1_id, :stop2_id, :distance, :duration, :prm_duration, :active])
  end
end
	
