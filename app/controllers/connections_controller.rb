class ConnectionsController < InheritedResources::Base
  custom_actions :resource => [:validate_connection, :invalidate_connection]

  # InheritedResources belongs_to are optionals
  belongs_to :stop, :parent_class => Stop, :polymorphic => true, :optional => true
  belongs_to :mis, :param => :miss_id, :parent_class => Mis, :polymorphic => true, :optional => true

  respond_to :kml, :only => :index
  respond_to :js, :only => :index

  def new
    @connection = Connection.new
    if parent_class == Stop
      @stop = parent
      @connection.stop1 = @stop
    end
    new!
  end

  #def destroy
  #  destroy! { @stop }
  #end

  def index
    if parent_class == Stop
      @stop = parent
      @mis = @stop.mis
    end
    @mis = parent if parent_class == Mis
    #@stop2 = Stop.find(stop_id_search2) until stop_id_search2.blank?
    #@mis2 = Mis.find(mis_id_search2) until mis_id_search2.blank?
    super do |format|
      format.kml { render 'map_layers/connections' }
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

  protected

  def collection
    ransack_params = params[:q]

    if ransack_params.present?
      stop_id_search1 = ransack_params["stop_id_search1"] if ransack_params["stop_id_search1"].present?
      mis_id_search1 = ransack_params["mis_id_search1"] if ransack_params["mis_id_search1"].present?
      stop_id_search2 = ransack_params["stop_id_search2"] if ransack_params["stop_id_search2"].present?
      mis_id_search2 = ransack_params["mis_id_search2"] if ransack_params["mis_id_search2"].present?
      ransack_params.delete("stop_id_search1") if ransack_params["stop_id_search1"].present?
      ransack_params.delete("mis_id_search1") if ransack_params["mis_id_search1"].present?
      ransack_params.delete("stop_id_search2") if ransack_params["stop_id_search2"].present?
      ransack_params.delete("mis_id_search2") if ransack_params["mis_id_search2"].present?
    end

    if mis_id_search1.blank?
      mis_id_search1 = Stop.find(stop_id_search1).mis_id unless stop_id_search1.blank?
    end
    if mis_id_search2.blank?
      mis_id_search2 = Stop.find(stop_id_search2).mis_id unless stop_id_search2.blank?
    end

    if mis_id_search1.blank? && mis_id_search2.blank?
      if (params[:miss_id].present?)
        @q = Mis.find(params[:miss_id]).connections.search(params[:q])
      elsif (params[:stop_id].present?)
        @q = Stop.find(params[:stop_id]).connections.search(params[:q])
      else
        @q = Connection.search(params[:q])
      end
    elsif mis_id_search1.blank? || mis_id_search2.blank?
      if stop_id_search1.blank? && stop_id_search2.blank?
        @q = mis_id_search1.blank? ? Mis.find(mis_id_search2).connections.search(params[:q]) : Mis.find(mis_id_search1).connections.search(params[:q])
      else
        @q = stop_id_search1.blank? ? Stop.find(stop_id_search2).connections.search(params[:q]) : Stop.find(stop_id_search1).connections.search(params[:q])
      end
    else
      if stop_id_search1.blank? && stop_id_search2.blank?
        @q = Mis.connections_inter_mis(mis_id_search1, mis_id_search2).search(params[:q])
      elsif stop_id_search1.blank? || stop_id_search2.blank?
        @q = stop_id_search1.blank? ? Stop.find(stop_id_search2).connections_with_mis(mis_id_search1).search(params[:q]) :
          Stop.find(stop_id_search1).connections_with_mis(mis_id_search2).search(params[:q])
      else
        @q = Stop.find(stop_id_search1).connections_with_stop(stop_id_search2).search(params[:q])
      end
    end

    list = @q.result(:distinct => true)
    @connections_count = list.count
    @connections ||= list.first(20)
  end

  private
  def permitted_params
    params.permit(:connection => [:stop1_id, :stop2_id, :stop_id, :distance, :duration, :prm_duration, :active, :stop_id_search1, :mis_id_search1])
  end
end

