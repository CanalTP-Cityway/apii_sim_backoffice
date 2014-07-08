require "spec_helper"

describe MiSystemsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mi_systems").to route_to("mi_systems#index")
    end

    it "routes to #show" do
      expect(:get => "/mi_systems/1").to route_to("mi_systems#show", :id => "1")
    end

  end
end
