require 'rails_helper'

describe MissController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/miss").to route_to("miss#index")
    end

    it "routes to #show" do
      expect(:get => "/miss/1").to route_to("miss#show", :id => "1")
    end

  end
end
