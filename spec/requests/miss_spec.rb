require 'rails_helper'

describe "Miss", :type => :request do
  describe "GET /miss" do
    it "works! (now write some real specs)" do
      get miss_index_path
      expect(response.status).to be(200)
    end
  end
end
