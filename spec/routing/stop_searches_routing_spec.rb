require "spec_helper"

describe StopSearchesController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/stop_searches").to route_to("stop_searches#index")
    end

    it "routes to #new" do
      expect(:get => "/stop_searches/new").to route_to("stop_searches#new")
    end

    it "routes to #show" do
      expect(:get => "/stop_searches/1").to route_to("stop_searches#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/stop_searches/1/edit").to route_to("stop_searches#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/stop_searches").to route_to("stop_searches#create")
    end

    it "routes to #update" do
      expect(:put => "/stop_searches/1").to route_to("stop_searches#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/stop_searches/1").to route_to("stop_searches#destroy", :id => "1")
    end

  end
end
