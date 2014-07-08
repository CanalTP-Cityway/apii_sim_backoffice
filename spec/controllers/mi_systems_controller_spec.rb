require 'spec_helper'

describe MiSystemsController, :type => :controller do
  
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all mi_systems as @mi_systems" do
      mi_system = create(:mi_system)
      get :index, {}, valid_session
      expect(assigns(:mi_systems)).to eq([mi_system])
    end
  end

  describe "GET show" do
    it "assigns the requested mi_system as @mi_system" do
      mi_system = create(:mi_system)
      get :show, {:id => mi_system.to_param}, valid_session
      expect(assigns(:mi_system)).to eq(mi_system)
    end
  end

end
