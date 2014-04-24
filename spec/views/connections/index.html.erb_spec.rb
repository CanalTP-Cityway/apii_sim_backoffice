require 'spec_helper'

describe "connections/index" do
  before(:each) do
    assign(:connections, [
      stub_model(Connection,
        :stop_1_id => nil,
        :stop_2_id => nil,
        :distance => 1,
        :duration => 2,
        :prm_duration => 3,
        :shape => ""
      ),
      stub_model(Connection,
        :stop_1_id => nil,
        :stop_2_id => nil,
        :distance => 1,
        :duration => 2,
        :prm_duration => 3,
        :shape => ""
      )
    ])
  end

  it "renders a list of connections" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
