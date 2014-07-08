class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def stop_search
    @stop_search = StopSearch.new()
  end
  helper_method :stop_search
  
end
