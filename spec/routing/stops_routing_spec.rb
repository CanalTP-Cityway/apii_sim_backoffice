require "spec_helper"

describe StopsController do

  describe "routing" do

    it "routes to #index" do
      expect(:get => "/stops").to route_to("stops#index")
    end

    it "routes to #show" do
      expect(:get => "/stops/1").to route_to("stops#show", :id => "1")
    end

  end

end
