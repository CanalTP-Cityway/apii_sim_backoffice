class WelcomeController < InheritedResources::Base
  
  def index
    @miss = Mis.all.limit(15)
    @imports = Import.all.limit(15)
  end
  
end
