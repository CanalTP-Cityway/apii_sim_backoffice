require 'spec_helper'

describe MissController, :type => :controller do
  
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all miss as @miss" do
      mis = create(:mis)
      get :index, {}, valid_session
      expect(assigns(:miss)).to eq([mis])
    end
  end

  describe "GET show" do
    it "assigns the requested mis as @mis" do
      mis = create(:mis)
      get :show, {:id => mis.to_param}, valid_session
      expect(assigns(:mis)).to eq(mis)
    end
  end

end
