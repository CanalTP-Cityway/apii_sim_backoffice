class WelcomeController < InheritedResources::Base
  
  def index
    @miss = Mis.all.limit(15)
    @stops = Stop.all.limit(15)
  end
  
  
end
