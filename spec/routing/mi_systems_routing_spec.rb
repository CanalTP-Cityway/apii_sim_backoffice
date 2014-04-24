require "spec_helper"

describe MiSystemsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mi_systems").to route_to("mi_systems#index")
    end

    it "routes to #new" do
      expect(:get => "/mi_systems/new").to route_to("mi_systems#new")
    end

    it "routes to #show" do
      expect(:get => "/mi_systems/1").to route_to("mi_systems#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mi_systems/1/edit").to route_to("mi_systems#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/mi_systems").to route_to("mi_systems#create")
    end

    it "routes to #update" do
      expect(:put => "/mi_systems/1").to route_to("mi_systems#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mi_systems/1").to route_to("mi_systems#destroy", :id => "1")
    end

  end
end
