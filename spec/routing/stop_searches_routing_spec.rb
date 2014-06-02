require "spec_helper"

describe StopSearchesController do

  describe "routing" do

    it "routes to #new" do
      expect(:get => "/stop_searches/new").to route_to("stop_searches#new")
    end

    it "routes to #create" do
      expect(:post => "/stop_searches").to route_to("stop_searches#create")
    end
  end

end
