class WelcomeController < InheritedResources::Base
  
  def index
    @mi_systems = MiSystem.all.limit(15)
    @stops = Stop.all.limit(15)
  end
  
  
end
