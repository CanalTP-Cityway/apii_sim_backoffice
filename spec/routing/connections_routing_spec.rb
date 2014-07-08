require "spec_helper"

describe ConnectionsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/stops/1/connections").to route_to("connections#index", :stop_id => "1")
    end

    it "routes to #new" do
      expect(:get => "/stops/1/connections/new").to route_to("connections#new", :stop_id => "1")
    end

    it "routes to #show" do
      expect(:get => "/stops/1/connections/1").to route_to("connections#show", :stop_id => "1", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/stops/1/connections/1/edit").to route_to("connections#edit", :stop_id => "1", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/stops/1/connections").to route_to("connections#create", :stop_id => "1")
    end

    it "routes to #update" do
      expect(:put => "/stops/1/connections/1").to route_to("connections#update", :stop_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/stops/1/connections/1").to route_to("connections#destroy", :stop_id => "1", :id => "1")
    end

    it "routes to #index of systems" do
      expect(:get => "/mi_systems/1/connections").to route_to("connections#index", :mi_system_id => "1")
    end

    it "routes to #show of systems" do
      expect(:get => "/mi_systems/1/connections/1").to route_to("connections#show", :mi_system_id => "1", :id => "1")
    end

  end
end
