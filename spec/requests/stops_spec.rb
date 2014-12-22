require 'rails_helper'

describe "Stops", :type => :request do
  describe "GET /stops" do
    it "works! (now write some real specs)" do
      get stops_path
      expect(response.status).to be(200)
    end
  end
end
